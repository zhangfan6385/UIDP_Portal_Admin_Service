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

        public DataTable getApplyInfo(string applyId)
        {
            return db.getApplyInfo(applyId);
        }

        public DataTable fetchApplyInfoList(Dictionary<string, object> d)
        {
            return db.fetchApplyInfoList(d);
        }
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
            sb.Append(d["CHECK_STATE"] == null ? "'," : GetIsNullStr(d["CHECK_STATE"]) + "', ");
            sb.Append(" CHECK_CONTENT='");
            sb.Append(d["CHECK_CONTENT"] == null ? "'," : GetIsNullStr(d["CHECK_CONTENT"]) + "', ");
            sb.Append(" CHECK_PERSON_ID='");
            sb.Append(d["CHECK_PERSON_ID"] == null ? "'," : GetIsNullStr(d["CHECK_PERSON_ID"]) + "', ");
            sb.Append(" CHECK_PERSON_NAME='");
            sb.Append(d["CHECK_PERSON_NAME"] == null ? "'," : GetIsNullStr(d["CHECK_PERSON_NAME"]) + "', ");
            //sb.Append(" CHECK_DATE='");
            //sb.Append(DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "'");
            sb.Append(" SERVICE_CODE='");
            sb.Append(d["SERVICE_CODE"] == null ? "'," : GetIsNullStr(d["SERVICE_CODE"]) + "', ");
            sb.Append(" CHECK_DATE=");
            sb.Append((d["CHECK_DATE"] == null|| d["CHECK_DATE"].ToString()=="") ? "null," :"'"+ GetIsNullStr(d["CHECK_DATE"]) + "', ");
            sb.Append(" APPLY_EXPIRET=");
            sb.Append((d["APPLY_EXPIRET"] == null || d["CHECK_DATE"].ToString() == "") ? "null" : "'" + GetIsNullStr(d["APPLY_EXPIRET"]) + "' ");
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
            //

            switch (d["APPLY_TYPE"].ToString())
            {
                case "0"://平台
                   
                    break;
                case "1"://组件
                    string sql2 = "update ts_store_component set DOWNLOAD_TIMES=(case when DOWNLOAD_TIMES is null then 0 else DOWNLOAD_TIMES end )+1 ";
                    sql2 += "where COMPONENT_ID='" + d["APPLY_RESOURCE_ID"].ToString() + "'";
                    sqllst.Add(sql2);
                    break;
                case "2"://服务
                    string sql3 = "update ts_store_service set SERVICE_TIMES=(case when SERVICE_TIMES is null then 0 else SERVICE_TIMES end )+1 ";
                    sql3 += "where SERVICE_ID='" + d["APPLY_RESOURCE_ID"].ToString() + "'";
                    sqllst.Add(sql3);
                    break;
                default:
                    break;
            }


           
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
