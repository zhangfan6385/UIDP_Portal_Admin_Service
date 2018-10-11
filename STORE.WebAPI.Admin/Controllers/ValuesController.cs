using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Http.Internal;
using Microsoft.AspNetCore.Mvc;

namespace STORE.WebAPI.Controllers
{
    [Route("[controller]")]
    public class ValuesController : Controller
    {

        /// <summary>
        /// 上传公告图片
        /// </summary>
        /// <param name="formCollection"></param>
        /// <returns></returns>
        [HttpPost("uploadNoticePic")]
        public IActionResult PostPic([FromForm]IFormCollection formCollection)
        {
            string result = "";
            try
            {
                FormFileCollection fileCollection = (FormFileCollection)formCollection.Files;
                foreach (IFormFile file in fileCollection)
                {
                    StreamReader reader = new StreamReader(file.OpenReadStream());
                    String content = reader.ReadToEnd();
                    String name = file.FileName;
                    string suffix = name.Substring(name.LastIndexOf("."), (name.Length - name.LastIndexOf("."))); //扩展名
                    //double filesize = Math.Round(Convert.ToDouble(file.Length / 1024.00 / 1024.00), 2);
                    string filepath = @"\\UploadFiles\\notice\\pic\\" + Guid.NewGuid().ToString() + suffix;
                    string filename = System.IO.Directory.GetCurrentDirectory() + filepath;
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

                    result = filepath;
                    return Json(result);
                }
            }
            catch (Exception)
            {
                return Json(result);

            }

            return Json(result);
        }


        /// <summary>
        /// 上传组件说明图片
        /// </summary>
        /// <param name="formCollection"></param>
        /// <returns></returns>
        [HttpPost("uploadComponentPic")]
        public IActionResult PostComponentPic([FromForm]IFormCollection formCollection)
        {
            string result = "";
            try
            {
                FormFileCollection fileCollection = (FormFileCollection)formCollection.Files;
                foreach (IFormFile file in fileCollection)
                {
                    StreamReader reader = new StreamReader(file.OpenReadStream());
                    String content = reader.ReadToEnd();
                    String name = file.FileName;
                    string suffix = name.Substring(name.LastIndexOf("."), (name.Length - name.LastIndexOf("."))); //扩展名
                    //double filesize = Math.Round(Convert.ToDouble(file.Length / 1024.00 / 1024.00), 2);
                    string filepath = @"\\UploadFiles\\component\\pic\\" + Guid.NewGuid().ToString() + suffix;
                    string filename = System.IO.Directory.GetCurrentDirectory() + filepath;
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

                    result = filepath;
                    return Json(result);
                }
            }
            catch (Exception)
            {
                return Json(result);

            }

            return Json(result);
        }



        /// <summary>
        /// 上传服务说明图片
        /// </summary>
        /// <param name="formCollection"></param>
        /// <returns></returns>
        [HttpPost("uploadServicePic")]
        public IActionResult PostServicePic([FromForm]IFormCollection formCollection)
        {
            string result = "";
            try
            {
                FormFileCollection fileCollection = (FormFileCollection)formCollection.Files;
                foreach (IFormFile file in fileCollection)
                {
                    StreamReader reader = new StreamReader(file.OpenReadStream());
                    String content = reader.ReadToEnd();
                    String name = file.FileName;
                    string suffix = name.Substring(name.LastIndexOf("."), (name.Length - name.LastIndexOf("."))); //扩展名
                    //double filesize = Math.Round(Convert.ToDouble(file.Length / 1024.00 / 1024.00), 2);
                    string filepath = @"\\UploadFiles\\service\\pic\\" + Guid.NewGuid().ToString() + suffix;
                    string filename = System.IO.Directory.GetCurrentDirectory() + filepath;
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

                    result = filepath;
                    return Json(result);
                }
            }
            catch (Exception)
            {
                return Json(result);

            }

            return Json(result);
        }


        /// <summary>
        /// 上传平台说明图片
        /// </summary>
        /// <param name="formCollection"></param>
        /// <returns></returns>
        [HttpPost("uploadPlatPic")]
        public IActionResult uploadPlatPic([FromForm]IFormCollection formCollection)
        {
            string result = "";
            try
            {
                FormFileCollection fileCollection = (FormFileCollection)formCollection.Files;
                foreach (IFormFile file in fileCollection)
                {
                    StreamReader reader = new StreamReader(file.OpenReadStream());
                    String content = reader.ReadToEnd();
                    String name = file.FileName;
                    string suffix = name.Substring(name.LastIndexOf("."), (name.Length - name.LastIndexOf("."))); //扩展名
                    //double filesize = Math.Round(Convert.ToDouble(file.Length / 1024.00 / 1024.00), 2);
                    string filepath = @"\\UploadFiles\\platform\\pic\\" + Guid.NewGuid().ToString() + suffix;
                    string filename = System.IO.Directory.GetCurrentDirectory() + filepath;
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

                    result = filepath;
                    return Json(result);
                }
            }
            catch (Exception)
            {
                return Json(result);

            }

            return Json(result);
        }
        // GET api/values
        [HttpGet]
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET api/values/5
        [HttpGet("{id}")]
        public string Get(int id)
        {
            return "value";
        }

        // POST api/values
        [HttpPost]
        public void Post([FromBody]string value)
        {
        }

        // PUT api/values/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE api/values/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
