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
    [Route("componentdetail")]
    public class ComponentDetailController : WebApiBaseController
    {
        ComponentDetailModule mm = new ComponentDetailModule();
        /// <summary>
        /// 查询配置信息
        /// </summary>
        /// <returns></returns>
        [HttpGet("fetchComponentDetailList")]
        public IActionResult fetchComponentDetailList(string COMPONENT_ID)
        {
            //UserModule user = new UserModule();
            //string Admin = user.getAdminCode();
            //bool isAdmin = UserId.Equals(Admin);
            //Dictionary<string, object> res = mm.GetPagedTable(isAdmin);
            //return Json(res);
            Dictionary<string, object> d = new Dictionary<string, object>();
            d["COMPONENT_ID"] = COMPONENT_ID;
            Dictionary<string, object> res = mm.fetchComponentDetailList(d);
            return Json(res);
        }
        /// <summary>
        /// 新增
        /// </summary>
        /// <param name="value"></param>
        /// <returns></returns>
        [HttpPost("createComponentDetailArticle")]
        public IActionResult createComponentDetailArticle([FromBody]JObject value)
        {
            Dictionary<string, object> d = value.ToObject<Dictionary<string, object>>();
            Dictionary<string, object> r = new Dictionary<string, object>();
            try
            {
                string b = mm.createComponentDetailArticle(d);
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
        [HttpPost("updateComponentDetailArticle")]
        public IActionResult updateComponentDetailArticle([FromBody]JObject value)
        {
            Dictionary<string, object> r = new Dictionary<string, object>();
            Dictionary<string, object> d = value.ToObject<Dictionary<string, object>>();
            try
            {
                string b = mm.updateComponentDetailArticle(d["COMPONENT_DETAIL_ID"].ToString());
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
        [HttpPost("uploadComponentFile")]
         public IActionResult PostFile([FromForm]IFormCollection formCollection,string componentId,string creater,string fileType,string fileName)
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
                    String filename = System.IO.Directory.GetCurrentDirectory() + "\\UploadFiles\\component\\" + Guid.NewGuid().ToString() + suffix;
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
                    d["COMPONENT_ID"] = componentId;
                    d["FILE_URL"] = @"\\UploadFiles\\component\\" + Guid.NewGuid().ToString() + suffix;
                    d["FILE_NAME"] = (string.IsNullOrEmpty(fileName))? name: fileName;
                    d["FILE_SIZE"] = filesize;
                    d["FILE_TYPE"] = fileType;
                    d["CREATER"] = creater;
                    r["message"] = mm.createComponentDetailArticle(d);
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