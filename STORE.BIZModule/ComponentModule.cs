using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using STORE.ODS;
using STORE.UTILITY;
using Newtonsoft.Json;

namespace STORE.BIZModule
{
   public class ComponentModule
    {
        ComponentDB db = new ComponentDB();
        OrgDB orgdb = new OrgDB();
        /// <summary>
        /// 查询
        /// </summary>
        /// <returns></returns>
        public Dictionary<string, object> fetchComponentList(Dictionary<string, object> d)
        {
            Dictionary<string, object> r = new Dictionary<string, object>();
            try
            {
                int limit = d["limit"] == null ? 100 : int.Parse(d["limit"].ToString());
                int page = d["page"] == null ? 1 : int.Parse(d["page"].ToString());
                DataTable dt = db.fetchComponentList(d);
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
        public string createComponentArticle(Dictionary<string, object> d)
        {
            d["COMPONENT_ID"] = Guid.NewGuid().ToString();
            if (d["MANAGE_ORG_ID"] != null && d["MANAGE_ORG_ID"].ToString() != "")
            {
                DataTable dta = orgdb.GetOrgById(d["MANAGE_ORG_ID"].ToString());
                d["MANAGE_ORG_NAME"] = dta.Rows[0]["ORG_NAME"].ToString();
            }
            int SwiftNumber = Convert.ToInt32(db.getComponentNum());
            SwiftNumber++;
            string ComponentCode = "ZJ"+DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString().PadLeft(2, '0')  + SwiftNumber.ToString().PadLeft(3, '0');
            d["COMPONENT_CODE"] = ComponentCode;
            return db.createComponentArticle(d);
        }
        /// <summary>
        /// 修改
        /// </summary>
        /// <param name="d"></param>
        /// <returns></returns>
        public string updateComponentData(Dictionary<string, object> d)
        {
            if (d["MANAGE_ORG_ID"] != null && d["MANAGE_ORG_ID"].ToString() != "")
            {
                DataTable dta = orgdb.GetOrgById(d["MANAGE_ORG_ID"].ToString());
                d["MANAGE_ORG_NAME"] = dta.Rows[0]["ORG_NAME"].ToString();
            }
            if (db.checkComponent(d["COMPONENT_ID"].ToString(), d["COMPONENT_CODE"].ToString())!="0")
            {
                return "操作失败，组件编号不能重复！";
            }
            return db.updateComponentData(d);
        }

        /// <summary>
        /// 删除
        /// </summary>
        /// <param name="d"></param>
        /// <returns></returns>
        public string updateComponentArticle(string id)
        {
            return db.updateComponentArticle(id);
        }

    }
}
