using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using STORE.ODS;
using STORE.UTILITY;
using Newtonsoft.Json;

namespace STORE.BIZModule
{
   public class ApplyModule
    {
        ApplyDB db = new ApplyDB();
        /// <summary>
        /// 查询
        /// </summary>
        /// <returns></returns>
        public Dictionary<string, object> fetchApplyPlatList(Dictionary<string, object> d)
        {
            Dictionary<string, object> r = new Dictionary<string, object>();
            try
            {
                int limit = d["limit"] == null ? 100 : int.Parse(d["limit"].ToString());
                int page = d["page"] == null ? 1 : int.Parse(d["page"].ToString());
                DataTable dt = db.fetchApplyPlatList(d);
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

        public Dictionary<string, object> fetchApplyComponentList(Dictionary<string, object> d)
        {
            Dictionary<string, object> r = new Dictionary<string, object>();
            try
            {
                int limit = d["limit"] == null ? 100 : int.Parse(d["limit"].ToString());
                int page = d["page"] == null ? 1 : int.Parse(d["page"].ToString());
                DataTable dt = db.fetchApplyComponentList(d);
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

        public Dictionary<string, object> fetchApplyServiceList(Dictionary<string, object> d)
        {
            Dictionary<string, object> r = new Dictionary<string, object>();
            try
            {
                int limit = d["limit"] == null ? 100 : int.Parse(d["limit"].ToString());
                int page = d["page"] == null ? 1 : int.Parse(d["page"].ToString());
                DataTable dt = db.fetchApplyServiceList(d);
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

        public string GetIsNullStr(object obj)
        {
            if (obj == null)
            {
                return "";
            }
            else
            {
                return obj.ToString();
            }
        }
        /// <summary>
        /// 修改
        /// </summary>
        /// <param name="d"></param>
        /// <returns></returns>
        public string examineApplyData(Dictionary<string, object> d, Dictionary<string, object> t)
        {
            List<string> sqllst = new List<string>();
            StringBuilder sb = new StringBuilder();
            sb.Append(" update ts_store_application set ");
            sb.Append(" CHECK_STATE='");
            sb.Append(d["CHECK_STATE"] == null ? "" : GetIsNullStr(d["CHECK_STATE"]) + "', ");
            sb.Append(" CHECK_CONTENT='");
            sb.Append(d["CHECK_CONTENT"] == null ? "" : GetIsNullStr(d["CHECK_CONTENT"]) + "', ");
            sb.Append(" CHECK_PERSON_ID='");
            sb.Append(d["CHECK_PERSON_ID"] == null ? "" : GetIsNullStr(d["CHECK_PERSON_ID"]) + "', ");
            sb.Append(" CHECK_PERSON_NAME='");
            sb.Append(d["CHECK_PERSON_NAME"] == null ? "" : GetIsNullStr(d["CHECK_PERSON_NAME"]) + "', ");
            sb.Append(" CHECK_DATE='");
            sb.Append(DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "'");
            sb.Append(" where APPLY_ID='" + GetIsNullStr(d["APPLY_ID"].ToString()) + "' ");
            sqllst.Add(sb.ToString());
            string col = "";
            string val = "";
            foreach (var v in t)
            {
                if (v.Value != null)
                {
                    col += "," + v.Key;
                    val += ",'" + v.Value + "'";
                }
                else
                {
                    col += "," + v.Key;
                    val += ",''";
                }
            }
            if (col != "")
            {
                col = col.Substring(1);
            }
            if (val != "")
            {
                val = val.Substring(1);
            }

            string sql = "INSERT INTO ts_store_application_record(" + col + ",CREATE_DATE,IS_DELETE,RECORD_ISREAD) VALUES(" + val + ",'" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "',0,0)";
            sqllst.Add(sql);
            //return db.examineApplyData(d);
            return db.examineApply(sqllst);
        }

        /// <summary>
        /// 删除
        /// </summary>
        /// <param name="d"></param>
        /// <returns></returns>
        public string updateApplyArticle(string id)
        {
            return db.updateApplyArticle(id);
        }

    }
}
