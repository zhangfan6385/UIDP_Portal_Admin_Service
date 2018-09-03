using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using STORE.ODS;
using STORE.UTILITY;
using Newtonsoft.Json;

namespace STORE.BIZModule
{
   public class ApplyRecordModule
    {
        ApplyRecordDB db = new ApplyRecordDB();
        /// <summary>
        /// 查询
        /// </summary>
        /// <returns></returns>
        public Dictionary<string, object> fetchApplyRecordList(Dictionary<string, object> d)
        {
            Dictionary<string, object> r = new Dictionary<string, object>();
            try
            {
                //int limit = d["limit"] == null ? 100 : int.Parse(d["limit"].ToString());
                //int page = d["page"] == null ? 1 : int.Parse(d["page"].ToString());
                DataTable dt = db.fetchApplyRecordList(d);
                r["total"] = dt.Rows.Count;
                r["items"] = KVTool.TableToListDic(dt);
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
        public string createApplyRecordArticle(Dictionary<string, object> d)
        {
            d["RECORD_ID"] = Guid.NewGuid().ToString();
            return db.createApplyRecordArticle(d);
        }
       
        /// <summary>
        /// 删除
        /// </summary>
        /// <param name="d"></param>
        /// <returns></returns>
        public string updateApplyRecordArticle(string id)
        {
            return db.updateApplyRecordArticle(id);
        }

    }
}
