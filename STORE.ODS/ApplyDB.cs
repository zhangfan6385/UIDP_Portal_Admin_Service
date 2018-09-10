using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using STORE.UTILITY;
namespace STORE.ODS
{
    public class ApplyDB
    {
        DBTool db = new DBTool("");
        /// <summary>
        /// 根据主键获取申请信息
        /// </summary>
        /// <param name="d"></param>
        /// <returns></returns>
        public DataTable getApplyInfo(string applyId)
        {
            string sql = "select * from ts_store_application a ";
            sql += " where 1=1 and IS_DELETE=0 and APPLY_ID='" + applyId + "'";
            return db.GetDataTable(sql);
        }
        /// <summary>
        /// 查询申请表信息
        /// </summary>
        /// <param name="d"></param>
        /// <returns></returns>
        public DataTable fetchApplyInfoList(Dictionary<string, object> d)
        {
            string sql = @"select a.* from ts_store_application a ";
            sql += " where a.IS_DELETE=0 ";
            if (d.Count > 0)
            {
                if (d["APPLY_ID"] != null && d["APPLY_ID"].ToString() != "")
                {
                    sql += " and a.APPLY_ID ='" + d["APPLY_ID"].ToString()+"'";
                }
            }
            //sql += " order by CHECK_STATE";
            return db.GetDataTable(sql);
        }


        /// <summary>
        /// 查询申请平台信息
        /// </summary>
        /// <param name="d"></param>
        /// <returns></returns>
        public DataTable fetchApplyPlatList(Dictionary<string, object> d)
        {
            string sql = @"select a.*,b.PLAT_NAME,b.PLAT_VERSION,b.MANAGE_TEL,c.ORG_CODE from ts_store_application a 
                INNER JOIN ts_store_platform b on a.APPLY_RESOURCE_ID = b.PLAT_ID
                INNER JOIN ts_uidp_org c on b.MANAGE_ORG_ID=c.ORG_ID";
            sql += " where a.APPLY_TYPE = 0 and a.IS_DELETE=0 and (APPLY_EXPIRET >='" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "' or APPLY_EXPIRET is null)";
            if (d.Count > 0)
            {
                
                if (d["PLAT_TYPE"] != null && d["PLAT_TYPE"].ToString() != "")
                {
                    sql += " and b.PLAT_TYPE =" + d["PLAT_TYPE"].ToString();
                }
                if (d["MANAGE_ORG_CODE"] != null && d["MANAGE_ORG_CODE"].ToString() != "")
                {
                    sql += " and c.ORG_CODE like '" + d["MANAGE_ORG_CODE"].ToString()+"%'";
                }
                if (d["APPLY_ORG_NAME"] != null && d["APPLY_ORG_NAME"].ToString() != "")
                {
                    sql += " and a.APPLY_ORG_NAME like '%" + d["APPLY_ORG_NAME"].ToString() + "%'";
                }
                if (d["PROJECT_NAME"] != null && d["PROJECT_NAME"].ToString() != "")
                {
                    sql += " and a.PROJECT_NAME like '%" + d["PROJECT_NAME"].ToString() + "%'";
                }
                if (d["BEGIN_APPLY_DATE"] != null && d["BEGIN_APPLY_DATE"].ToString() != "" && (d["END_APPLY_DATE"] == null || d["END_APPLY_DATE"].ToString() == ""))
                {
                    DateTime date = Convert.ToDateTime(d["BEGIN_APPLY_DATE"].ToString());
                    sql += " and APPLY_DATE > '" + date.Year + "-" + date.Month + "-" + date.Day + " 00:00:00'";
                    //sql += " and NOTICE_DATETIME between '" + date.Year + "-" + date.Month + "-" + date.Day + " 00:00:00' and '" + date.Year + "-" + date.Month + "-" + date.Day + " 23:59:59'";
                }
                else if (d["END_APPLY_DATE"] != null && d["END_APPLY_DATE"].ToString() != "" && (d["BEGIN_APPLY_DATE"] == null || d["BEGIN_APPLY_DATE"].ToString() == ""))
                {
                    DateTime date = Convert.ToDateTime(d["END_APPLY_DATE"].ToString());
                    sql += " and APPLY_DATE < '" + date.Year + "-" + date.Month + "-" + date.Day + " 23:59:59'";

                }
                else if (d["BEGIN_APPLY_DATE"] != null && d["BEGIN_APPLY_DATE"].ToString() != "" && d["END_APPLY_DATE"] != null && d["END_APPLY_DATE"].ToString() != "")
                {
                    DateTime bdate = Convert.ToDateTime(d["BEGIN_APPLY_DATE"].ToString());
                    DateTime edate = Convert.ToDateTime(d["END_APPLY_DATE"].ToString());
                    sql += " and APPLY_DATE between '" + bdate.Year + "-" + bdate.Month + "-" + bdate.Day + " 00:00:00' and '" + edate.Year + "-" + edate.Month + "-" + edate.Day + " 23:59:59'";
                }
            }
            sql += " order by CHECK_STATE";
            return db.GetDataTable(sql);
        }

        /// <summary>
        /// 查询申请组件信息
        /// </summary>
        /// <param name="d"></param>
        /// <returns></returns>
        public DataTable fetchApplyComponentList(Dictionary<string, object> d)
        {
            string sql = @"select a.*,b.COMPONENT_NAME,b.COMPONENT_CODE,b.MANAGE_TEL,c.ORG_CODE from ts_store_application a 
            INNER JOIN ts_store_component b on a.APPLY_RESOURCE_ID = b.COMPONENT_ID 
            INNER JOIN ts_uidp_org c on b.MANAGE_ORG_ID=c.ORG_ID";
            sql += " where a.APPLY_TYPE = 1 and a.IS_DELETE=0 and (APPLY_EXPIRET >='" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "' or APPLY_EXPIRET is null)";
            if (d.Count > 0)
            {
                if (d["APPLY_ORG_NAME"] != null && d["APPLY_ORG_NAME"].ToString() != "")
                {
                    sql += " and a.APPLY_ORG_NAME like '%" + d["APPLY_ORG_NAME"].ToString() + "%'";
                }
                if (d["MANAGE_ORG_CODE"] != null && d["MANAGE_ORG_CODE"].ToString() != "")
                {
                    sql += " and c.ORG_CODE like '" + d["MANAGE_ORG_CODE"].ToString()+"%'";
                }
                if (d["PROJECT_NAME"] != null && d["PROJECT_NAME"].ToString() != "")
                {
                    sql += " and a.PROJECT_NAME like '%" + d["PROJECT_NAME"].ToString() + "%'";
                }
                if (d["BEGIN_APPLY_DATE"] != null && d["BEGIN_APPLY_DATE"].ToString() != "" && (d["END_APPLY_DATE"] == null || d["END_APPLY_DATE"].ToString() == ""))
                {
                    DateTime date = Convert.ToDateTime(d["BEGIN_APPLY_DATE"].ToString());
                    sql += " and APPLY_DATE > '" + date.Year + "-" + date.Month + "-" + date.Day + " 00:00:00'";
                    //sql += " and NOTICE_DATETIME between '" + date.Year + "-" + date.Month + "-" + date.Day + " 00:00:00' and '" + date.Year + "-" + date.Month + "-" + date.Day + " 23:59:59'";
                }
                else if (d["END_APPLY_DATE"] != null && d["END_APPLY_DATE"].ToString() != "" && (d["BEGIN_APPLY_DATE"] == null || d["BEGIN_APPLY_DATE"].ToString() == ""))
                {
                    DateTime date = Convert.ToDateTime(d["END_APPLY_DATE"].ToString());
                    sql += " and APPLY_DATE < '" + date.Year + "-" + date.Month + "-" + date.Day + " 23:59:59'";

                }
                else if (d["BEGIN_APPLY_DATE"] != null && d["BEGIN_APPLY_DATE"].ToString() != "" && d["END_APPLY_DATE"] != null && d["END_APPLY_DATE"].ToString() != "")
                {
                    DateTime bdate = Convert.ToDateTime(d["BEGIN_APPLY_DATE"].ToString());
                    DateTime edate = Convert.ToDateTime(d["END_APPLY_DATE"].ToString());
                    sql += " and APPLY_DATE between '" + bdate.Year + "-" + bdate.Month + "-" + bdate.Day + " 00:00:00' and '" + edate.Year + "-" + edate.Month + "-" + edate.Day + " 23:59:59'";
                }
            }
            sql += " order by CHECK_STATE";
            return db.GetDataTable(sql);
        }


        /// <summary>
        /// 查询申请服务信息
        /// </summary>
        /// <param name="d"></param>
        /// <returns></returns>
        public DataTable fetchApplyServiceList(Dictionary<string, object> d)
        {
            string sql = @"select a.*,b.SERVICE_NAME,b.SERVICE_CODE,b.MANAGE_TEL,c.ORG_CODE from ts_store_application a 
            INNER JOIN ts_store_service b on a.APPLY_RESOURCE_ID = b.SERVICE_ID
            INNER JOIN ts_uidp_org c on b.MANAGE_ORG_ID=c.ORG_ID";
            sql += " where a.APPLY_TYPE = 2 and a.IS_DELETE=0 and (APPLY_EXPIRET >='" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "' or APPLY_EXPIRET is null)";
            if (d.Count > 0)
            {
                if (d["APPLY_ORG_NAME"] != null && d["APPLY_ORG_NAME"].ToString() != "")
                {
                    sql += " and a.APPLY_ORG_NAME like '%" + d["APPLY_ORG_NAME"].ToString() + "%'";
                }
                if (d["MANAGE_ORG_CODE"] != null && d["MANAGE_ORG_CODE"].ToString() != "")
                {
                    sql += " and c.ORG_CODE like '" + d["MANAGE_ORG_CODE"].ToString()+"%'";
                }
                if (d["PROJECT_NAME"] != null && d["PROJECT_NAME"].ToString() != "")
                {
                    sql += " and a.PROJECT_NAME like '%" + d["PROJECT_NAME"].ToString() + "%'";
                }
                if (d["BEGIN_APPLY_DATE"] != null && d["BEGIN_APPLY_DATE"].ToString() != "" && (d["END_APPLY_DATE"] == null || d["END_APPLY_DATE"].ToString() == ""))
                {
                    DateTime date = Convert.ToDateTime(d["BEGIN_APPLY_DATE"].ToString());
                    sql += " and APPLY_DATE > '" + date.Year + "-" + date.Month + "-" + date.Day + " 00:00:00'";
                    //sql += " and NOTICE_DATETIME between '" + date.Year + "-" + date.Month + "-" + date.Day + " 00:00:00' and '" + date.Year + "-" + date.Month + "-" + date.Day + " 23:59:59'";
                }
                else if (d["END_APPLY_DATE"] != null && d["END_APPLY_DATE"].ToString() != "" && (d["BEGIN_APPLY_DATE"] == null || d["BEGIN_APPLY_DATE"].ToString() == ""))
                {
                    DateTime date = Convert.ToDateTime(d["END_APPLY_DATE"].ToString());
                    sql += " and APPLY_DATE < '" + date.Year + "-" + date.Month + "-" + date.Day + " 23:59:59'";

                }
                else if (d["BEGIN_APPLY_DATE"] != null && d["BEGIN_APPLY_DATE"].ToString() != "" && d["END_APPLY_DATE"] != null && d["END_APPLY_DATE"].ToString() != "")
                {
                    DateTime bdate = Convert.ToDateTime(d["BEGIN_APPLY_DATE"].ToString());
                    DateTime edate = Convert.ToDateTime(d["END_APPLY_DATE"].ToString());
                    sql += " and APPLY_DATE between '" + bdate.Year + "-" + bdate.Month + "-" + bdate.Day + " 00:00:00' and '" + edate.Year + "-" + edate.Month + "-" + edate.Day + " 23:59:59'";
                }
            }
            sql += " order by CHECK_STATE";
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


        //public string examineApplyData(Dictionary<string, object> d)
        //{
        //    StringBuilder sb = new StringBuilder();
        //    sb.Append(" update ts_store_application set ");
        //    sb.Append(" CHECK_STATE='");
        //    sb.Append(d["CHECK_STATE"] == null ? "" : GetIsNullStr(d["CHECK_STATE"]) + "', ");
        //    sb.Append(" CHECK_CONTENT='");
        //    sb.Append(d["CHECK_CONTENT"] == null ? "" : GetIsNullStr(d["CHECK_CONTENT"]) + "', ");
        //    sb.Append(" CHECK_PERSON_ID='");
        //    sb.Append(d["CHECK_PERSON_ID"] == null ? "" : GetIsNullStr(d["CHECK_PERSON_ID"]) + "', ");
        //    sb.Append(" CHECK_PERSON_NAME='");
        //    sb.Append(d["CHECK_PERSON_NAME"] == null ? "" : GetIsNullStr(d["CHECK_PERSON_NAME"]) + "', ");
        //    sb.Append(" CHECK_DATE='");
        //    sb.Append( DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "', ");
        //    sb.Append("' where APPLY_ID='" + GetIsNullStr(d["APPLY_ID"].ToString()) + "' ");
        //    return db.ExecutByStringResult(sb.ToString());
        //}


        public string updateApplyArticle(string id)
        {
            List<string> lst = new List<string>();
            string sql = "update ts_store_application set IS_DELETE=1 where APPLY_ID ='" + id + "'";
            string sql2 = "update ts_store_application_record set IS_DELETE=1 where APPLY_ID ='" + id + "'";
            lst.Add(sql);
            lst.Add(sql2);
            return db.Executs(lst);
            //return db.ExecutByStringResult(sql);
        }

        public string examineApply(List<string> sqllst)
        {
            return db.Executs(sqllst);
        }
    }
}