using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using STORE.UTILITY;
namespace STORE.ODS
{
    public class CommunityPostDB
    {
        DBTool db = new DBTool("");
        /// <summary>
        /// 查询社区信息
        /// </summary>
        /// <param name="d"></param>
        /// <returns></returns>
        public DataTable getCommunityPostList(Dictionary<string, object> d)
        {
            string sql = "select a.* ,(select count(*) from ts_community_comment where POST_ID=a.POST_ID) COMMONT_COUNT,(select count(*) from ts_community_collection where POST_ID=a.POST_ID) COLLECTION_COUNT,case when POST_TYPE = 3 then '--' else SCORE_POINT end SCORE";
            sql += " from ts_community_post a ";
            sql += " where  IS_DELETE=0 ";
            if (d.Count > 0)
            {
                if (d["POST_TYPE"] != null && d["POST_TYPE"].ToString() != "")
                {
                    sql += " and a.POST_TYPE =" + d["POST_TYPE"].ToString();
                }
                
                if (d["USER_ID"] != null && d["USER_ID"].ToString() != "")
                {
                    sql += " and a.USER_ID like '" + d["USER_ID"].ToString() + "'";
                }
                if (d["TITLE_NAME"] != null && d["TITLE_NAME"].ToString() != "")
                {
                    sql += " and a.TITLE_NAME like '%" + d["TITLE_NAME"].ToString() + "%'";
                }
                if (d["BEGIN_SEND_DATE"] != null && d["BEGIN_SEND_DATE"].ToString() != "" && (d["END_SEND_DATE"] == null || d["END_SEND_DATE"].ToString() == ""))
                {
                    DateTime date = Convert.ToDateTime(d["BEGIN_SEND_DATE"].ToString());
                    sql += " and SEND_DATE > '" + date.Year + "-" + date.Month + "-" + date.Day + " 00:00:00'";
                    //sql += " and NOTICE_DATETIME between '" + date.Year + "-" + date.Month + "-" + date.Day + " 00:00:00' and '" + date.Year + "-" + date.Month + "-" + date.Day + " 23:59:59'";
                }
                else if (d["END_SEND_DATE"] != null && d["END_SEND_DATE"].ToString() != "" && (d["BEGIN_SEND_DATE"] == null || d["BEGIN_SEND_DATE"].ToString() == ""))
                {
                    DateTime date = Convert.ToDateTime(d["END_SEND_DATE"].ToString());
                    sql += " and SEND_DATE < '" + date.Year + "-" + date.Month + "-" + date.Day + " 23:59:59'";

                }
                else if (d["BEGIN_SEND_DATE"] != null && d["BEGIN_SEND_DATE"].ToString() != "" && d["END_SEND_DATE"] != null && d["END_SEND_DATE"].ToString() != "")
                {
                    DateTime bdate = Convert.ToDateTime(d["BEGIN_SEND_DATE"].ToString());
                    DateTime edate = Convert.ToDateTime(d["END_SEND_DATE"].ToString());
                    sql += " and SEND_DATE between '" + bdate.Year + "-" + bdate.Month + "-" + bdate.Day + " 00:00:00' and '" + edate.Year + "-" + edate.Month + "-" + edate.Day + " 23:59:59'";
                }
                sql += " ORDER BY a.CREATE_DATE desc ";
            }
            return db.GetDataTable(sql);
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

        public string delPostByID(Dictionary<string, object> d)
        {
            string sql1 = "delete from ts_community_comment where POST_ID='" + d["POST_ID"].ToString() + "'";
            string sql2 = "delete from ts_community_post where POST_ID='" + d["POST_ID"].ToString() + "'";
            List<string> sql = new List<string>();
            sql.Add(sql1);
            sql.Add(sql2);
            return db.Executs(sql);
        }
    }
}