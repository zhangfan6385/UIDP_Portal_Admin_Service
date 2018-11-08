using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using STORE.ODS;
using STORE.UTILITY;
using Newtonsoft.Json;

namespace STORE.BIZModule
{
   public class PlatModule
    {
        PlatDB db = new PlatDB();
        OrgDB orgdb = new OrgDB();
        /// <summary>
        /// 查询
        /// </summary>
        /// <returns></returns>
        public Dictionary<string, object> fetchPlatformList(Dictionary<string, object> d)
        {
            Dictionary<string, object> r = new Dictionary<string, object>();
            try
            {
                int limit = d["limit"] == null ? 100 : int.Parse(d["limit"].ToString());
                int page = d["page"] == null ? 1 : int.Parse(d["page"].ToString());
                DataTable dt = db.fetchPlatformList(d);
                r["total"] = dt.Rows.Count;
                r["items"] = KVTool.TableToListDic(KVTool.GetPagedTable(dt, page, limit));
                r["code"] = 2000;
                r["message"] = "查询成功";
            }
            catch (Exception ex)
            {
                r["items"] = null;
                r["code"] = -1;
                r["message"] = ex.Message;
            }
            return r;
        }

        /// <summary>
        /// 新增
        /// </summary>
        /// <param name="d"></param>
        /// <returns></returns>
        public string createPlatformArticle(Dictionary<string, object> d)
        {
            d["PLAT_ID"] = Guid.NewGuid().ToString();
            if (d["MANAGE_ORG_ID"] != null && d["MANAGE_ORG_ID"].ToString() != "")
            {
                DataTable dta = orgdb.GetOrgById(d["MANAGE_ORG_ID"].ToString());
                d["MANAGE_ORG_NAME"] = dta.Rows[0]["ORG_NAME"].ToString();
            }
            return db.createPlatformArticle(d);
        }
        /// <summary>
        /// 修改
        /// </summary>
        /// <param name="d"></param>
        /// <returns></returns>
        public string updatePlatformData(Dictionary<string, object> d)
        {
            if (d["MANAGE_ORG_ID"] != null && d["MANAGE_ORG_ID"].ToString() != "")
            {
                DataTable dta = orgdb.GetOrgById(d["MANAGE_ORG_ID"].ToString());
                d["MANAGE_ORG_NAME"] = dta.Rows[0]["ORG_SHORT_NAME"].ToString();
            }
            return db.updatePlatformData(d);
        }

        /// <summary>
        /// 删除
        /// </summary>
        /// <param name="d"></param>
        /// <returns></returns>
        public string updatePlatformArticle(string id)
        {
            return db.updatePlatformArticle(id);
        }

    }
}
