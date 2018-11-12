using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using STORE.BIZModule;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using Microsoft.AspNetCore.Http.Internal;
using System.Data;
using System.IO;
using Microsoft.AspNetCore.Hosting;
using STORE.UTILITY;
using MailKit.Net.Smtp;
using MimeKit;
using MimeKit.Text;
using Microsoft.Extensions.Configuration;
using System.Configuration;

namespace STORE.WebAPI.Controllers
{
    [Produces("application/json")]
    [Route("apply")]
    public class ApplyController : WebApiBaseController
    {
        ApplyModule mm = new ApplyModule();
        ApplyRecordModule rm = new ApplyRecordModule();
        ConfModule cm = new ConfModule();
        ServiceModule sm = new ServiceModule();
        public static IConfiguration Configuration { get; set; }
        /// <summary>
        /// 查询配置信息
        /// </summary>
        /// <returns></returns>
        [HttpGet("fetchApplyPlatList")]
        public IActionResult fetchApplyPlatList(string limit, string page, int PLAT_TYPE, string MANAGE_ORG_CODE, string APPLY_ORG_NAME, string PROJECT_NAME, string BEGIN_APPLY_DATE, string END_APPLY_DATE)
        {
            //UserModule user = new UserModule();
            //string Admin = user.getAdminCode();
            //bool isAdmin = UserId.Equals(Admin);
            //Dictionary<string, object> res = mm.GetPagedTable(isAdmin);
            //return Json(res);
            Dictionary<string, object> d = new Dictionary<string, object>();
            d["limit"] = limit;
            d["page"] = page;
            d["PLAT_TYPE"] = PLAT_TYPE;
            d["APPLY_ORG_NAME"] = APPLY_ORG_NAME;
            d["MANAGE_ORG_CODE"] = MANAGE_ORG_CODE;
            d["PROJECT_NAME"] = PROJECT_NAME;
            d["BEGIN_APPLY_DATE"] = BEGIN_APPLY_DATE;
            d["END_APPLY_DATE"] = END_APPLY_DATE;
            Dictionary<string, object> res = mm.fetchApplyPlatList(d);
            return Json(res);
        }


        [HttpGet("fetchApplyComponentList")]
        public IActionResult fetchApplyComponentList(string limit, string page, string MANAGE_ORG_CODE, string APPLY_ORG_NAME, string PROJECT_NAME, string BEGIN_APPLY_DATE, string END_APPLY_DATE)
        {
            //UserModule user = new UserModule();
            //string Admin = user.getAdminCode();
            //bool isAdmin = UserId.Equals(Admin);
            //Dictionary<string, object> res = mm.GetPagedTable(isAdmin);
            //return Json(res);
            Dictionary<string, object> d = new Dictionary<string, object>();
            d["limit"] = limit;
            d["page"] = page;
            d["APPLY_ORG_NAME"] = APPLY_ORG_NAME;
            d["MANAGE_ORG_CODE"] = MANAGE_ORG_CODE;
            d["PROJECT_NAME"] = PROJECT_NAME;
            d["BEGIN_APPLY_DATE"] = BEGIN_APPLY_DATE;
            d["END_APPLY_DATE"] = END_APPLY_DATE;
            Dictionary<string, object> res = mm.fetchApplyComponentList(d);
            return Json(res);
        }


        [HttpGet("fetchApplyServiceList")]
        public IActionResult fetchApplyServiceList(string limit, string page, string MANAGE_ORG_CODE, string APPLY_ORG_NAME, string PROJECT_NAME, string BEGIN_APPLY_DATE, string END_APPLY_DATE)
        {
            //UserModule user = new UserModule();
            //string Admin = user.getAdminCode();
            //bool isAdmin = UserId.Equals(Admin);
            //Dictionary<string, object> res = mm.GetPagedTable(isAdmin);
            //return Json(res);
            Dictionary<string, object> d = new Dictionary<string, object>();
            d["limit"] = limit;
            d["page"] = page;
            d["APPLY_ORG_NAME"] = APPLY_ORG_NAME;
            d["PROJECT_NAME"] = PROJECT_NAME;
            d["MANAGE_ORG_CODE"] = MANAGE_ORG_CODE;
            d["BEGIN_APPLY_DATE"] = BEGIN_APPLY_DATE;
            d["END_APPLY_DATE"] = END_APPLY_DATE;
            Dictionary<string, object> res = mm.fetchApplyServiceList(d);
            return Json(res);
        }

        /// <summary>
        /// 发送邮件(支持Html发送，支持添加一个附件)
        /// </summary>
        /// <param name="sendUserName">发件人姓名</param>
        /// <param name="sendUrl">发件人邮箱地址</param>
        /// <param name="smtpAddress">smpt服务器地址</param>
        /// <param name="port">端口号</param>
        /// <param name="password">授权码</param>
        /// <param name="subject">邮件标题</param>
        /// <param name="email">收件人地址</param>
        /// <param name="content">邮件内容</param>
        /// <param name="filepath">文件的相对路径</param>

        public async Task<string> SendEmail(string subject, string email, string content, string filepath = null)
        {
            try
            {
                //System.Threading.Thread.Sleep(1000);
                Dictionary<string, object> d = new Dictionary<string, object>();
                d["CONF_CODE"] = "'SendMail','SendName','SmtpAddress','Port','Auth_Code'";
                string sendUserName = "";
                string sendMail = "";
                string smtpAddress = "";
                int port = 25;
                string password = "";
                DataTable smtpdt = cm.getSmtpConfig(d);
                if (smtpdt == null || smtpdt.Rows.Count == 0)
                {
                    throw new Exception("邮件参数配置发生错误！");
                }
                foreach (DataRow row in smtpdt.Rows)
                {
                    if (row["CONF_CODE"].ToString() == "SendMail")
                    {
                        sendMail = row["CONF_VALUE"].ToString();
                    }
                    if (row["CONF_CODE"].ToString() == "SendName")
                    {
                        sendUserName = row["CONF_VALUE"].ToString();
                    }
                    if (row["CONF_CODE"].ToString() == "SmtpAddress")
                    {
                        smtpAddress = row["CONF_VALUE"].ToString();
                    }
                    if (row["CONF_CODE"].ToString() == "Port")
                    {
                        port = Convert.ToInt32(row["CONF_VALUE"].ToString());
                    }
                    if (row["CONF_CODE"].ToString() == "Auth_Code")
                    {
                        password = row["CONF_VALUE"].ToString();
                    }
                }

                var message = new MimeMessage();
                //发信人
                message.From.Add(new MailboxAddress(sendUserName, sendMail));
                //收信人
                message.To.Add(new MailboxAddress("", email));
                //标题
                message.Subject = subject;
                //产生一个支持Html的TextPart
                var body = new TextPart(TextFormat.Html)
                {
                    Text = content
                };
                //先产生一个
                var multipart = new Multipart("mixed");
                //添加正文内容
                multipart.Add(body);
                if (!string.IsNullOrWhiteSpace(filepath))
                {
                    ////生产一个绝对路径
                    ////filepath = "Upload//NewsPhoto//readme.txt";
                    //var absolutePath = Path.Combine(_hostingEnv.WebRootPath, string.Format(filepath));
                    ////附件
                    //var attachment = new MimePart()
                    //{
                    //    //读取文件(只能用绝对路径)
                    //    ContentObject = new ContentObject(File.OpenRead(absolutePath), ContentEncoding.Default),
                    //    ContentDisposition = new ContentDisposition(ContentDisposition.Attachment),
                    //    ContentTransferEncoding = ContentEncoding.Base64,
                    //    //文件名字
                    //    FileName = Path.GetFileName(absolutePath)
                    //};
                    ////添加附件
                    //multipart.Add(attachment);
                }
                //正文内容
                message.Body = multipart;

                using (var client = new SmtpClient())
                {
                    //连接到Smtp服务器
                    //client.Connect("smtp.163.com", 25, false);
                    client.Connect(smtpAddress, port, true);
                    //登陆
                    //client.Authenticate("Maverick_man@163.com", "1qaz2wsx");
                    client.Authenticate(sendMail, password);
                    //发送
                    client.Send(message);
                    //断开
                    client.Disconnect(true);
                }
            }
            catch (Exception)
            {
                return "";
            }

            return "";
        }

        /// <summary>
        /// 修改
        /// </summary>
        /// <param name="value"></param>
        /// <returns></returns>
        [HttpPost("examineApplyData")]
        //public IActionResult examineApplyData([FromBody]JObject[] value)
        public async Task<IActionResult> examineApplyData([FromBody]JObject[] value)
        {
            Dictionary<string, object> d = value[0].ToObject<Dictionary<string, object>>();
            Dictionary<string, object> t = value[1].ToObject<Dictionary<string, object>>();
            Dictionary<string, object> r = new Dictionary<string, object>();
            Dictionary<string, object> q = new Dictionary<string, object>();
            t["RECORD_ID"] = Guid.NewGuid().ToString();
            d["CHECK_DATE"] = "";
            d["SERVICE_CODE"] = "";
            d["SERVICE_NAME"] = "";
            d["APPLY_EXPIRET"] = "";
            d["APPLY_TYPE"] = "";
            d["APPLY_EMAIL"] = "";
            try
            {
                DataTable validate = mm.fetchApplyInfoList(d);
                d["APPLY_TYPE"] = validate.Rows[0]["APPLY_TYPE"].ToString();
                d["APPLY_RESOURCE_ID"] = validate.Rows[0]["APPLY_RESOURCE_ID"].ToString();
                d["APPLY_EMAIL"] = validate.Rows[0]["APPLY_EMAIL"].ToString();
                var builder = new ConfigurationBuilder()
.SetBasePath(Directory.GetCurrentDirectory())
.AddJsonFile("appsettings.json");
                Configuration = builder.Build();
                string Content1 = Configuration["Content1"].ToString();
                string Content2 = Configuration["Content2"].ToString();
                string Content3 = Configuration["Content3"].ToString();
                string Content4 = Configuration["Content4"].ToString();
                string Telephone = Configuration["Telephone"].ToString();
                string Unit = Configuration["Unit"].ToString();
                t["RECORD_CONTENT"] = t["RECORD_CONTENT"].ToString().Replace("&Content1", Content1).Replace("&Content2", Content2).Replace("&Content3", Content3).Replace("&Content4", Content4).Replace("&Telephone", Telephone).Replace("&Unit", Unit);
                if (validate != null && validate.Rows.Count > 0 && validate.Rows[0]["CHECK_STATE"].ToString() != d["CHECK_STATE"].ToString())
                {
                    DateTime timestamp = DateTime.Now;
                    if (validate.Rows[0]["APPLY_TYPE"].ToString() == "2" && d["CHECK_STATE"].ToString() == "1")//0开发平台1组件2服务
                    {
                        string accessToken = AccessTokenTool.GetAccessToken(d["APPLY_ID"].ToString());
                        DataTable serviceInfo = sm.getServiceInfo(d);
                        if (serviceInfo != null && serviceInfo.Rows.Count > 0)
                        {
                            d["SERVICE_NAME"] = serviceInfo.Rows[0]["SERVICE_NAME"].ToString();
                            d["SERVICE_CODE"] = accessToken;
                            //t["RECORD_CONTENT"] = t["RECORD_CONTENT"].ToString();
                            //d["CHECK_DATE"] = timestamp.ToString("yyyy-MM-dd HH:mm:ss");
                            //d["SERVICE_CODE"] = serviceInfo.Rows[0]["SERVICE_URL"].ToString() + "?token=" + accessToken;
                            //t["RECORD_CONTENT"] = t["RECORD_CONTENT"].ToString().Replace(d["SERVICE_NAME"].ToString(), d["SERVICE_NAME"].ToString()+"("+ d["SERVICE_CODE"].ToString()+")");
                        }
                    }
                    if (validate.Rows[0]["USE_TYPE"].ToString() == "0")//0开发1生产
                    {
                        q["CONF_CODE"] = "DEVELOP_EXPIRET";
                        if (d.Keys.Contains("CHECK_DATE") && (d["CHECK_DATE"] == null || d["CHECK_DATE"].ToString() == ""))
                        {
                            d["CHECK_DATE"] = timestamp.ToString("yyyy-MM-dd HH:mm:ss");
                            double duration = Convert.ToDouble(cm.getConfigInfo(q));
                            d["APPLY_EXPIRET"] = timestamp.AddDays(duration);
                        }
                    }
                    else if (validate.Rows[0]["USE_TYPE"].ToString() == "1")
                    {
                        q["CONF_CODE"] = "PRODUCT_EXPIRET";
                        if (d.Keys.Contains("CHECK_DATE") && string.IsNullOrEmpty(d["CHECK_DATE"].ToString()))
                        {
                            double duration = Convert.ToDouble(cm.getConfigInfo(q));
                            d["CHECK_DATE"] = timestamp.ToString("yyyy-MM-dd HH:mm:ss");
                            d["APPLY_EXPIRET"] = timestamp.AddDays(duration);
                        }
                    }
                    else
                    {
                        throw new Exception("用途类型读取失败！");
                    }
                    if (d["CHECK_STATE"].ToString() == "2")
                    {
                        d["CHECK_DATE"] = timestamp.ToString("yyyy-MM-dd HH:mm:ss");
                        d["APPLY_EXPIRET"] = null;
                        d["SERVICE_CODE"] = null;
                    }
                    //SendEmail(t["RECORD_TITLE"].ToString(), d["APPLY_EMAIL"].ToString(), t["RECORD_CONTENT"].ToString());
                }
                else
                {
                    d["CHECK_DATE"] = validate.Rows[0]["CHECK_DATE"].ToString();
                    d["APPLY_EXPIRET"] = validate.Rows[0]["APPLY_EXPIRET"].ToString();
                    d["SERVICE_CODE"] = validate.Rows[0]["SERVICE_CODE"].ToString();
                }
                string b = mm.examineApplyData(d, t);
                if (b == "")
                {
                    //SendEmail(t["RECORD_TITLE"].ToString(), "1312719913@qq.com", t["RECORD_CONTENT"].ToString());
                    await SendEmail(t["RECORD_TITLE"].ToString(), d["APPLY_EMAIL"].ToString(), t["RECORD_CONTENT"].ToString());
                    r["message"] = "成功";
                    r["code"] = 2000;
                }
                else
                {
                    r["code"] = -1;
                    r["message"] = b;
                }
            }
            catch (Exception e)
            {
                r["code"] = -1;
                r["message"] = e.Message;
            }
            return Json(r);
        }
        /// <summary>
        /// 删除
        /// </summary>
        /// <param name="value"></param>
        /// <returns></returns>
        [HttpPost("updateApplyArticle")]
        public IActionResult updateApplyArticle([FromBody]JObject value)
        {
            Dictionary<string, object> r = new Dictionary<string, object>();
            Dictionary<string, object> d = value.ToObject<Dictionary<string, object>>();
            try
            {
                string b = mm.updateApplyArticle(d["APPLY_ID"].ToString());
                if (b == "")
                {
                    r["message"] = "成功";

                    r["code"] = 2000;
                }
                else
                {
                    r["code"] = -1;
                    r["message"] = b;
                }

            }
            catch (Exception e)
            {
                r["code"] = -1;
                r["message"] = e.Message;
            }
            return Json(r);
        }

    }
}