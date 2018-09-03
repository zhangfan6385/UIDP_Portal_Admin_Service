using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using STORE.UTILITY;
namespace STORE.ODS
{
    public class ApplyRecordDB
    {
        DBTool db = new DBTool("");
        /// <summary>
        /// 查询公告附件信息
        /// </summary>
        /// <param name="d"></param>
        /// <returns></returns>
        public DataTable fetchApplyRecordList(Dictionary<string, object> d)
        {
            string sql = "select * from ts_store_application_record a ";
            sql += " where 1=1 and IS_DELETE=0 ";
            //if (d.Count > 0)
            //{
            //    if (d["NOTICE_ID"] != null && d["NOTICE_ID"].ToString() != "")
            //    {
            //        sql += " and a.NOTICE_ID = '" + d["NOTICE_ID"].ToString() + "'";
            //    }
            //}
            return db.GetDataTable(sql);
        }
        public string createApplyRecordArticle(Dictionary<string, object> d)
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

            string sql = "INSERT INTO ts_store_application_record(" + col + ",CREATE_DATE,IS_DELETE,RECORD_ISREAD) VALUES(" + val + ",'" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "',0,0)";

            return db.ExecutByStringResult(sql);
        }

     

        public string updateApplyRecordArticle(string id)
        {
            string sql = "update ts_store_application_record set IS_DELETE=1 where RECORD_ID ='" + id + "'";
            return db.ExecutByStringResult(sql);
        }


    }
}