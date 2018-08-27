using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using STORE.ODS;
using STORE.UTILITY;
using Newtonsoft.Json;

namespace STORE.BIZModule
{
   public class PlatDetailModule
    {
        PlatDetailDB db = new PlatDetailDB();
        /// <summary>
        /// 查询
        /// </summary>
        /// <returns></returns>
        public Dictionary<string, object> fetchPlatDetailList(Dictionary<string, object> d)
        {
            Dictionary<string, object> r = new Dictionary<string, object>();
            try
            {
                //int limit = d["limit"] == null ? 100 : int.Parse(d["limit"].ToString());
                //int page = d["page"] == null ? 1 : int.Parse(d["page"].ToString());
                DataTable dt = db.fetchPlatDetailList(d);
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
        public string createPlatDetailArticle(Dictionary<string, object> d)
        {
            d["PLAT_DETAIL_ID"] = Guid.NewGuid().ToString();
            return db.createPlatDetailArticle(d);
        }
       
        /// <summary>
        /// 删除
        /// </summary>
        /// <param name="d"></param>
        /// <returns></returns>
        public string updatePlatDetailArticle(string id)
        {
            return db.updatePlatDetailArticle(id);
        }

    }
}
