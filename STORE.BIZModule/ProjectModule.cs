using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using STORE.ODS;
using STORE.UTILITY;
using Newtonsoft.Json;

namespace STORE.BIZModule
{
   public class ProjectModule
    {
        ProjectDB db = new ProjectDB();
        OrgDB orgdb = new OrgDB();
        /// <summary>
        /// 查询
        /// </summary>
        /// <returns></returns>
        public Dictionary<string, object> fetchProjectList(Dictionary<string, object> d)
        {
            Dictionary<string, object> r = new Dictionary<string, object>();
            try
            {
                int limit = d["limit"] == null ? 100 : int.Parse(d["limit"].ToString());
                int page = d["page"] == null ? 1 : int.Parse(d["page"].ToString());
                DataTable dt = db.fetchProjectList(d);
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
        public string createProjectArticle(Dictionary<string, object> d)
        {
            d["PROJECT_ID"] = Guid.NewGuid().ToString();
            if (d["PROJECT_PARTYA_ID"]!=null&& d["PROJECT_PARTYA_ID"].ToString()!="") {
            DataTable dta= orgdb.GetOrgById(d["PROJECT_PARTYA_ID"].ToString());
            d["PROJECT_PARTYA_CODE"] = dta.Rows[0]["ORG_CODE"].ToString();
            d["PROJECT_PARTYA_NAME"] = dta.Rows[0]["ORG_NAME"].ToString();
            }
            if (d["PROJECT_PARTYB_ID"] != null && d["PROJECT_PARTYB_ID"].ToString() != "")
            {
                DataTable dtb = orgdb.GetOrgById(d["PROJECT_PARTYB_ID"].ToString());
                d["PROJECT_PARTYB_CODE"] = dtb.Rows[0]["ORG_CODE"].ToString();
                d["PROJECT_PARTYB_NAME"] = dtb.Rows[0]["ORG_NAME"].ToString();
            }
            return db.createProjectArticle(d);
        }
        /// <summary>
        /// 修改
        /// </summary>
        /// <param name="d"></param>
        /// <returns></returns>
        public string updateProjectData(Dictionary<string, object> d)
        {
            if (d["PROJECT_PARTYA_ID"] != null && d["PROJECT_PARTYA_ID"].ToString() != "")
            {
                DataTable dta = orgdb.GetOrgById(d["PROJECT_PARTYA_ID"].ToString());
                d["PROJECT_PARTYA_CODE"] = dta.Rows[0]["ORG_CODE"].ToString();
                d["PROJECT_PARTYA_NAME"] = dta.Rows[0]["ORG_NAME"].ToString();
            }
            if (d["PROJECT_PARTYB_ID"] != null && d["PROJECT_PARTYB_ID"].ToString() != "")
            {
                DataTable dtb = orgdb.GetOrgById(d["PROJECT_PARTYB_ID"].ToString());
                d["PROJECT_PARTYB_CODE"] = dtb.Rows[0]["ORG_CODE"].ToString();
                d["PROJECT_PARTYB_NAME"] = dtb.Rows[0]["ORG_NAME"].ToString();
            }
            return db.updateProjectData(d);
        }

        /// <summary>
        /// 删除
        /// </summary>
        /// <param name="d"></param>
        /// <returns></returns>
        public string updateProjectArticle(string id)
        {
            return db.updateProjectArticle(id);
        }

    }
}
