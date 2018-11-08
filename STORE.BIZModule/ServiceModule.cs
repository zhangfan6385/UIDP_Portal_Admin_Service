using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using STORE.ODS;
using STORE.UTILITY;
using Newtonsoft.Json;
using System.Linq;

namespace STORE.BIZModule
{
   public class ServiceModule
    {
        ServiceDB db = new ServiceDB();
        OrgDB orgdb = new OrgDB();

        public DataTable getServiceInfo(Dictionary<string, object> d)
        {
            return db.getServiceInfo(d);
        }
            
        /// <summary>
        /// 查询
        /// </summary>
        /// <returns></returns>
        public Dictionary<string, object> fetchServiceList(Dictionary<string, object> d)
        {
            Dictionary<string, object> r = new Dictionary<string, object>();
            try
            {
                int limit = d["limit"] == null ? 100 : int.Parse(d["limit"].ToString());
                int page = d["page"] == null ? 1 : int.Parse(d["page"].ToString());
                DataTable dt = db.fetchServiceList(d);
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
        public string createServiceArticle(Dictionary<string, object> d)
        {
            d["SERVICE_ID"] = Guid.NewGuid().ToString();
            if (d["MANAGE_ORG_ID"] != null && d["MANAGE_ORG_ID"].ToString() != "")
            {
                DataTable dta = orgdb.GetOrgById(d["MANAGE_ORG_ID"].ToString());
                d["MANAGE_ORG_NAME"] = dta.Rows[0]["ORG_SHORT_NAME"].ToString();
            }
            int SwiftNumber = Convert.ToInt32(db.getServiceNum());
            SwiftNumber++;
            string ServiceCode = "FW" + DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString().PadLeft(2, '0') + SwiftNumber.ToString().PadLeft(3, '0');
            d["SERVICE_CODE"] = ServiceCode;
            return db.createServiceArticle(d);
        }
        /// <summary>
        /// 修改
        /// </summary>
        /// <param name="d"></param>
        /// <returns></returns>
        public string updateServiceData(Dictionary<string, object> d)
        {
            if (d["MANAGE_ORG_ID"] != null && d["MANAGE_ORG_ID"].ToString() != "")
            {
                DataTable dta = orgdb.GetOrgById(d["MANAGE_ORG_ID"].ToString());
                d["MANAGE_ORG_NAME"] = dta.Rows[0]["ORG_NAME"].ToString();
            }
            if (db.checkService(d["SERVICE_ID"].ToString(), d["SERVICE_CODE"].ToString()) != "0")
            {
                return "操作失败，服务编号不能重复！";
            }
            return db.updateServiceData(d);
        }

        /// <summary>
        /// 删除
        /// </summary>
        /// <param name="d"></param>
        /// <returns></returns>
        public string updateServiceArticle(string id)
        {
            return db.updateServiceArticle(id);
        }

    }
}
