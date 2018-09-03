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

namespace STORE.WebAPI.Controllers
{
    [Produces("application/json")]
    [Consumes("application/json", "multipart/form-data")]
    [Route("servicedetail")]
    public class ServiceDetailController : WebApiBaseController
    {
        ServiceDetailModule mm = new ServiceDetailModule();
        /// <summary>
        /// 查询配置信息
        /// </summary>
        /// <returns></returns>
        [HttpGet("fetchServiceDetailList")]
        public IActionResult fetchServiceDetailList(string SERVICE_ID)
        {
            //UserModule user = new UserModule();
            //string Admin = user.getAdminCode();
            //bool isAdmin = UserId.Equals(Admin);
            //Dictionary<string, object> res = mm.GetPagedTable(isAdmin);
            //return Json(res);
            Dictionary<string, object> d = new Dictionary<string, object>();
            d["SERVICE_ID"] = SERVICE_ID;
            Dictionary<string, object> res = mm.fetchServiceDetailList(d);
            return Json(res);
        }
        /// <summary>
        /// 新增
        /// </summary>
        /// <param name="value"></param>
        /// <returns></returns>
        [HttpPost("createServiceDetailArticle")]
        public IActionResult createServiceDetailArticle([FromBody]JObject value)
        {
            Dictionary<string, object> d = value.ToObject<Dictionary<string, object>>();
            Dictionary<string, object> r = new Dictionary<string, object>();
            try
            {
                string b = mm.createServiceDetailArticle(d);
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
       
        /// <summary>
        /// 删除
        /// </summary>
        /// <param name="value"></param>
        /// <returns></returns>
        [HttpPost("updateServiceDetailArticle")]
        public IActionResult updateServiceDetailArticle([FromBody]JObject value)
        {
            Dictionary<string, object> r = new Dictionary<string, object>();
            Dictionary<string, object> d = value.ToObject<Dictionary<string, object>>();
            try
            {
                string b = mm.updateServiceDetailArticle(d["SERVICE_DETAIL_ID"].ToString());
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



        /// <summary>
        /// 上传附件
        /// </summary>
        /// <param name="formCollection"></param>
        /// <returns></returns>
        [HttpPost("uploadServiceFile")]
         public IActionResult PostFile([FromForm]IFormCollection formCollection,string serviceId,string creater,string fileType,string fileName)
        {
            Dictionary<string, object> r = new Dictionary<string, object>();
            try
            {
                FormFileCollection fileCollection = (FormFileCollection)formCollection.Files;
                foreach (IFormFile file in fileCollection)
                {
                    StreamReader reader = new StreamReader(file.OpenReadStream());
                    String content = reader.ReadToEnd();
                    String name = file.FileName;
                    string suffix = name.Substring(name.LastIndexOf("."), (name.Length - name.LastIndexOf("."))); //扩展名
                    double filesize =Math.Round(Convert.ToDouble(file.Length / 1024.00 / 1024.00),2);
                    string filepath = @"\\UploadFiles\\service\\" + Guid.NewGuid().ToString() + suffix;
                    String filename = System.IO.Directory.GetCurrentDirectory() + filepath;
                    if (System.IO.File.Exists(filename))
                    {
                        System.IO.File.Delete(filename);
                    }
                    using (FileStream fs = System.IO.File.Create(filename))
                    {
                        // 复制文件
                        file.CopyTo(fs);
                        // 清空缓冲区数据
                        fs.Flush();
                    }
                    Dictionary<string, object> d = new Dictionary<string, object>();
                    d["SERVICE_ID"] = serviceId;
                    d["FILE_URL"] = filepath;
                    d["FILE_NAME"] = (string.IsNullOrEmpty(fileName))? name: fileName;
                    d["FILE_SIZE"] = filesize;
                    d["FILE_TYPE"] = fileType;
                    d["CREATER"] = creater;
                    r["message"] = mm.createServiceDetailArticle(d);
                    if (r["message"].ToString() != "")
                    {
                        r["code"] = -1;
                    }
                    else
                    {
                        r["code"] = 2000;
                    }
                    Json(r);
                }
            }
            catch (Exception ex)
            {
                r["code"] = -1;
                r["message"] = ex.Message;
            }

            return Json(r);
        }


    }
}