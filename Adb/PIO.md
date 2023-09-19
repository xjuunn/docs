~~~ C#
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using static System.Windows.Forms.LinkLabel;

namespace PIo
{
    public partial class PIO : Form
    {
        private float rateX;
        private float rateY;
        private List<Point> points;
        private string path = "";
        private Thread playthread;
        private List<NoteBean> noteBean;
        private bool isruning = false;
        private int pasue = 0;
        public PIO()
        {
            InitializeComponent();
            CheckForIllegalCrossThreadCalls = false;
        }

        private void PIO_Load(object sender, EventArgs e)
        {
            Point pix = getPix();
            Point maxXY = getMaxXY();
            rateX = pix.X / (float)maxXY.X;
            rateY = pix.Y / (float)maxXY.Y;
        }
        private void Test_Click(object sender, EventArgs e)
        {
            points = new List<Point>();
            Thread thread = new Thread(new ThreadStart(initPoints));
            thread.Start();
        }
        private void btnPlay_Click(object sender, EventArgs e)
        {
            if (playthread == null)
            {
                playthread = new Thread(Play);
                playthread.Start();
            }
            isruning = !isruning;
            btnPlay.Text = isruning ? "暂停" : "继续";
        }
        private void btnstop_Click(object sender, EventArgs e)
        {
            playthread.Abort();
            playthread = null;
        }
        #region 输入按键

        private Point getPix()
        {
            string pix = CMDRun.CMDRunner("adb shell wm size");
            pix = pix.Split(' ')[pix.Split(' ').Length - 1];
            int pixx = Convert.ToInt32(pix.Split('x')[0]);
            int pixy = Convert.ToInt32(pix.Split('x')[1]);
            return new Point(pixx, pixy);
        }

        private int getMaxPoint(string xy)
        {
            string xstr = CMDRun.CMDRunner($"adb shell getevent -p | findstr \"{xy}\"");
            string[] xarr = xstr.Replace(",", "").Replace(":", "").Split(' ');
            int x = 0;
            for (int i = 0; i < xarr.Length; i++)
            {
                try
                {
                    if (xarr[i] != "max" && i < xarr.Length - 3) continue;
                    if (x < Convert.ToInt32(xarr[i + 1])) x = Convert.ToInt32(xarr[i + 1]);
                }
                catch { continue; }

            }
            return x;
        }
        private Point getMaxXY()
        {
            return new Point(getMaxPoint("0035"), getMaxPoint("0036"));
        }

        private Point getClick()
        {
            Process adb = new Process();
            adb.StartInfo.FileName = "adb";
            adb.StartInfo.Arguments = "shell";
            adb.StartInfo.UseShellExecute = false;
            adb.StartInfo.RedirectStandardInput = true;
            adb.StartInfo.RedirectStandardOutput = true;
            adb.StartInfo.RedirectStandardError = true;
            adb.StartInfo.CreateNoWindow = true;
            adb.StartInfo.WindowStyle = ProcessWindowStyle.Hidden;
            adb.Start();
            adb.StandardInput.WriteLine("getevent");
            string line;
            int maxx = 0;
            int maxy = 0;
            while ((line = adb.StandardOutput.ReadLine()) != null)
            {
                try
                {
                    if (line.Contains("0035")) maxx = Convert.ToInt32(line.Split(' ')[line.Split(' ').Length - 1].Trim(), 16);
                    if (line.Contains("0036")) maxy = Convert.ToInt32(line.Split(' ')[line.Split(' ').Length - 1].Trim(), 16);
                    if (maxx != 0 && maxy != 0)
                    {
                        return new Point(maxx, maxy);
                    }
                }
                catch
                {
                    continue;
                }
            }
            return new Point(-1, -1);
        }
        private Point getClickPoint()
        {
            Point click = getClick();
            return new Point((int)(click.X * rateX), (int)(click.Y * rateY));
        }
        private void initPoints()
        {
            lbltest.Text = "输入键位";
            for (int i = 0; i < 15; i++)
            {
                Point p =  getClickPoint();
                lbltest.Text = "键位输入(" + p.X + "," + p.Y + ")   " + (points.Count + 1) + "/15";
                points.Add(p);
                Thread.Sleep(100);

            }
            lbltest.Text = "键位输入完成";
        }
        #endregion
        #region 导入乐谱

        private void Form1_DragEnter(object sender, DragEventArgs e)
        {
            if (e.Data.GetDataPresent(DataFormats.FileDrop))
                e.Effect = DragDropEffects.All;
            else
                e.Effect = DragDropEffects.None;
        }

        private void Form1_DragDrop(object sender, DragEventArgs e)
        {
            path = ((System.Array)e.Data.GetData(DataFormats.FileDrop)).GetValue(0).ToString();
            noteBean = JsonTool.JsonFileToObject<List<NoteBean>>(path);
            lbltest.Text = noteBean[0].name;
            lblcontent.Text = $"作者：{noteBean[0].author}\n转录者：{noteBean[0].transcribedBy}\n";
        }
        #endregion
        #region 演奏
        private void Play()
        {
            int p = 0;
            Thread.Sleep(1000);
            ClickaKey(noteBean[0].songNotes[0].key);
            for (int i = 1; i < noteBean[0].songNotes.Count; i++)
            {
                while (!isruning) Thread.Sleep(100);
                p = noteBean[0].songNotes[i].time - noteBean[0].songNotes[i - 1].time;
                if (p < pasue) p = pasue;
                Thread.Sleep(p);
                ClickaKey(noteBean[0].songNotes[i].key);
            }
        }
        private void ClickaKey(string strkey)
        {
            string[] arkey = strkey.Replace("Key"," ").Split(' ');
            string type = arkey[0];
            int keynum = Convert.ToInt32(arkey[1]);
            lblInfo.Text = strkey;
            CMDRun.runcmd($"adb shell input tap {points[keynum].Y} {points[keynum].X}");
        }
        #endregion

    }
}

~~~

