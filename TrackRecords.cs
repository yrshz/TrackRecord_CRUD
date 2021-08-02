using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SKF_Track_Record_2021
{
    public class TrackRecords
    {
        private int TRANSACTIONID;
        private int INDUSTRYID;
        private int ASSET_TYPEID;
        private int YEAR;
        private string COMPANY;
        private string BUILDING;
        private string LANDLORD;
        private string MUNICIPALITY;
        private int AREA;
        private int REVENUE;
        private int TRANSACTION_VALUE;
        private string AGENT;

        public TrackRecords(int tRANSACTIONID, int iNDUSTRYID, int aSSET_TYPEID, int yEAR, string cOMPANY, string bUILDING, string lANDLORD, string mUNICIPALITY, int aREA, int rEVENUE, int tRANSACTION_VALUE, string aGENT)
        {
            TRANSACTIONID = tRANSACTIONID;
            INDUSTRYID = iNDUSTRYID;
            ASSET_TYPEID = aSSET_TYPEID;
            YEAR = yEAR;
            COMPANY = cOMPANY;
            BUILDING = bUILDING;
            LANDLORD = lANDLORD;
            MUNICIPALITY = mUNICIPALITY;
            AREA = aREA;
            REVENUE = rEVENUE;
            TRANSACTION_VALUE = tRANSACTION_VALUE;
            AGENT = aGENT;
        }

        public int TRANSACTIONID1 { get => TRANSACTIONID; set => TRANSACTIONID = value; }
        public int INDUSTRYID1 { get => INDUSTRYID; set => INDUSTRYID = value; }
        public int ASSET_TYPEID1 { get => ASSET_TYPEID; set => ASSET_TYPEID = value; }
        public int YEAR1 { get => YEAR; set => YEAR = value; }
        public string COMPANY1 { get => COMPANY; set => COMPANY = value; }
        public string BUILDING1 { get => BUILDING; set => BUILDING = value; }
        public string LANDLORD1 { get => LANDLORD; set => LANDLORD = value; }
        public string MUNICIPALITY1 { get => MUNICIPALITY; set => MUNICIPALITY = value; }
        public int AREA1 { get => AREA; set => AREA = value; }
        public int REVENUE1 { get => REVENUE; set => REVENUE = value; }
        public int TRANSACTION_VALUE1 { get => TRANSACTION_VALUE; set => TRANSACTION_VALUE = value; }
        public string AGENT1 { get => AGENT; set => AGENT = value; }
    }
}