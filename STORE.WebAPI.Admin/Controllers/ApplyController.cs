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
    [Route("apply")]
    public class ApplyController : WebApiBaseController
    {
        ApplyModule mm = new ApplyModule();
        ApplyRecordModule rm = new ApplyRecordModule();
        /// <summary>
        /// 查询配置信息
        /// </summary>
        /// <returns></returns>
        [HttpGet("fetchApplyPlatList")]
        public IActionResult fetchApplyPlatList(string limit, string page, int PLAT_TYPE, string APPLY_ORG_NAME, string PROJECT_NAME, string BEGIN_APPLY_DATE, string END_APPLY_DATE)
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
            d["PROJECT_NAME"] = PROJECT_NAME;
            d["BEGIN_APPLY_DATE"] = BEGIN_APPLY_DATE;
            d["END_APPLY_DATE"] = END_APPLY_DATE;
            Dictionary<string, object> res = mm.fetchApplyPlatList(d);
            return Json(res);
        }


        [HttpGet("fetchApplyComponentList")]
        public IActionResult fetchApplyComponentList(string limit, string page,  string APPLY_ORG_NAME, string PROJECT_NAME, string BEGIN_APPLY_DATE, string END_APPLY_DATE)
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
            d["BEGIN_APPLY_DATE"] = BEGIN_APPLY_DATE;
            d["END_APPLY_DATE"] = END_APPLY_DATE;
            Dictionary<string, object> res = mm.fetchApplyComponentList(d);
            return Json(res);
        }


        [HttpGet("fetchApplyServiceList")]
        public IActionResult fetchApplyServiceList(string limit, string page, string APPLY_ORG_NAME, string PROJECT_NAME, string BEGIN_APPLY_DATE, string END_APPLY_DATE)
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
            d["BEGIN_APPLY_DATE"] = BEGIN_APPLY_DATE;
            d["END_APPLY_DATE"] = END_APPLY_DATE;
            Dictionary<string, object> res = mm.fetchApplyServiceList(d);
            return Json(res);
        }


        /// <summary>
        /// 修改
        /// </summary>
        /// <param name="value"></param>
        /// <returns></returns>
        [HttpPost("examineApplyData")]
        public IActionResult examineApplyData([FromBody]JObject[] value)
        {
            Dictionary<string, object> d = value[0].ToObject<Dictionary<string, object>>();
            Dictionary<string, object> t = value[1].ToObject<Dictionary<string, object>>();
            t["RECORD_ID"] = Guid.NewGuid().ToString();
            Dictionary<string, object> r = new Dictionary<string, object>();
            try
            {
                string b = mm.examineApplyData(d,t);
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