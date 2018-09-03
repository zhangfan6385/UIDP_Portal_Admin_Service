using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using STORE.UTILITY;
namespace STORE.ODS
{
    public class ScoreConfigDB
    {
        DBTool db = new DBTool("");
        /// <summary>
        /// 查询公告信息
        /// </summary>
        /// <param name="d"></param>
        /// <returns></returns>
        public DataTable fetchScoreConfigList(Dictionary<string, object> d)
        {
            string sql = "select * from ts_community_score_conf a ";
            sql += " where 1=1 and IS_DELETE=0 ";
            if (d.Count > 0)
            {
                if (d["OPER_TYPE_NAME"] != null && d["OPER_TYPE_NAME"].ToString() != "")
                {
                    sql += " and a.OPER_TYPE_NAME like '%" + d["OPER_TYPE_NAME"].ToString() + "%'";
                }
             
            }
            return db.GetDataTable(sql);
        }


        public string createScoreConfigArticle(Dictionary<string, object> d)
        {
            string col = "";
            string val = "";
            foreach (var v in d)
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

            string sql = "INSERT INTO ts_community_score_conf(" + col + ",CREATE_DATE,IS_DELETE) VALUES(" + val + ",'"+ DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "',0)";

            return db.ExecutByStringResult(sql);
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

        public string updateScoreConfigData(Dictionary<string, object> d)
        {
            string col = "";

            foreach (var v in d)
            {
                if (v.Value == null)
                {
                    col += "," + v.Key + "=''";
                }
                else
                {
                    col += "," + v.Key + "='" + v.Value.ToString() + "'";
                }


            }
            if (col != "")
            {
                col = col.Substring(1);
            }

            string sql = "update ts_community_score_conf set " + col + " where SCORE_CONF_ID='" + d["SCORE_CONF_ID"].ToString() + "'";

            return db.ExecutByStringResult(sql);
        }

        public string updateScoreConfigArticle(string id)
        {
            string sql = "update ts_community_score_conf set IS_DELETE=1 where SCORE_CONF_ID ='" + id + "'";

            return db.ExecutByStringResult(sql);
        }

      

    }
}