using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using STORE.ODS;
using STORE.UTILITY;
using Newtonsoft.Json;

namespace STORE.BIZModule
{
   public class ScoreConfigModule
    {
        ScoreConfigDB db = new ScoreConfigDB();
        /// <summary>
        /// 查询
        /// </summary>
        /// <returns></returns>
        public Dictionary<string, object> fetchScoreConfigList(Dictionary<string, object> d)
        {
            Dictionary<string, object> r = new Dictionary<string, object>();
            try
            {
                int limit = d["limit"] == null ? 100 : int.Parse(d["limit"].ToString());
                int page = d["page"] == null ? 1 : int.Parse(d["page"].ToString());
                DataTable dt = db.fetchScoreConfigList(d);
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
        public string createScoreConfigArticle(Dictionary<string, object> d)
        {
            d["SCORE_CONF_ID"] = Guid.NewGuid().ToString();
            return db.createScoreConfigArticle(d);
        }
        /// <summary>
        /// 修改
        /// </summary>
        /// <param name="d"></param>
        /// <returns></returns>
        public string updateScoreConfigData(Dictionary<string, object> d)
        {
            return db.updateScoreConfigData(d);
        }

        /// <summary>
        /// 删除
        /// </summary>
        /// <param name="d"></param>
        /// <returns></returns>
        public string updateScoreConfigArticle(string id)
        {
            return db.updateScoreConfigArticle(id);
        }

    }
}
