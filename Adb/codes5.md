

执行cmd命令

~~~ C#
internal class CMDRun
    {
        public static string CMDRunner(string cmd)
        {
            ProcessStartInfo psi = new ProcessStartInfo("cmd.exe");
            psi.Arguments = "/C "+cmd;
            psi.RedirectStandardOutput = true;
            psi.RedirectStandardError = true;
            psi.UseShellExecute = false;
            Process p = new Process();
            p.StartInfo = psi;
            p.Start();
            string output = p.StandardOutput.ReadToEnd();
            p.WaitForExit();
            Console.WriteLine(output);
            return output;
        }
    }
~~~

获得被点击的0035x和0036y

~~~C#
Process adb = new Process();
adb.StartInfo.FileName = "adb";
adb.StartInfo.Arguments = "shell";
adb.StartInfo.UseShellExecute = false;
adb.StartInfo.RedirectStandardInput = true;
adb.StartInfo.RedirectStandardOutput = true;
adb.Start();
adb.StandardInput.WriteLine("getevent");
string line;
int maxx = 0;
int maxy = 0;
while ((line = adb.StandardOutput.ReadLine()) != null)//Convert.ToInt32(line.Split("0035")[1], 16)
{
    try
    {
        if (line.Contains("0035")) maxx = Convert.ToInt32(line.Split("0035")[1].Trim(), 16);
        if (line.Contains("0036")) maxy = Convert.ToInt32(line.Split("0036")[1].Trim(), 16);
        if (maxx != 0 && maxy != 0)
        {
            Console.WriteLine(maxx + "      " + maxy + "\n\n");
        }
    }
    catch
    {
        Console.WriteLine("参数错误！");
        continue;
    }
}
~~~

获得分辨率

~~~ C#
string pix = CMDRun.CMDRunner("adb shell wm size");
pix = pix.Split(' ')[pix.Split(" ").Length-1];
int pixx = Convert.ToInt32(pix.Split('x')[0]);
int pixy = Convert.ToInt32(pix.Split('x')[1]);
Console.WriteLine($"分辨率x: {pixx}  y: {pixy}  ");
~~~

获取Maxx和Maxy

~~~ C#
string xstr = CMDRun.CMDRunner("adb shell getevent -p | findstr \"0036\"");
string[] xarr = xstr.Replace(",", "").Replace(":", "").Split(" ");
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
Console.WriteLine(x);
~~~



















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

namespace PIo
{
    public partial class PIO : Form
    {
        private float rateX;
        private float rateY;
        private List<Point> points = new List<Point>();
        public PIO()
        {
            InitializeComponent();
            CheckForIllegalCrossThreadCalls = false;
        }

        private void PIO_Load(object sender, EventArgs e)
        {
            Point pix = getPix();
            Point maxXY = getMaxXY();
            rateX = pix.X/(float)maxXY.X;
            rateY = pix.Y/(float)maxXY.Y;
        }
        private void Test_Click(object sender, EventArgs e)
        {
            Test.Text = "00";
            Thread thread = new Thread(new ThreadStart(initPoints));
            thread.Start();
            
        }
        //adb shell input tap 300 300

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
            adb.Close();
            line = adb.StandardOutput.ReadLine();
            while (line != null)
            {
                try
                {
                    if (line.Contains("0035")) maxx = Convert.ToInt32(line.Split(' ')[line.Split(' ').Length - 1].Trim(), 16);
                    if (line.Contains("0036")) maxy = Convert.ToInt32(line.Split(' ')[line.Split(' ').Length - 1].Trim(), 16);
                    if (maxx != 0 && maxy != 0)
                    {
                        adb.Close();
                        return new Point(maxx,maxy);
                    }
                }
                catch
                {
                    continue;
                }
            }
            return new Point(-1,-1);
        }
        private Point getClickPoint()
        {
            Point click = getClick();
            return new Point((int)(click.X * rateX), (int)(click.Y * rateY));
        }
        private void initPoints()
        {
            for (int i = 0; i < 15; i++)
            {
                points.Add(getClickPoint());
                lbltest.Text = i.ToString();
            }
            lbltest.Text = "OK";
        }
    }
}

~~~

