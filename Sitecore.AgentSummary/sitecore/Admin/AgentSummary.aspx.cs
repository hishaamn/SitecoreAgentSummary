
namespace Sitecore.AgentSummary.sitecore.Admin
{
    using System;
    using System.Collections.Generic;
    using System.Web.UI;
    using System.Xml;
    using Sitecore.Configuration;
    using Sitecore.StringExtensions;
    using Sitecore.Xml;

    public partial class AgentSummary : Page
    {
        public List<AgentDetails> AgentList
        {
            get
            {
                var agentList = new List<AgentDetails>();

                var agentNodes = Factory.GetConfigNodes("scheduling/agent");

                var activeFlag = true;

                foreach (XmlNode agentNode in agentNodes)
                {
                    try
                    {
                        if (!XmlUtil.GetAttribute("name", agentNode).IsNullOrEmpty())
                        {
                            var interval = DateTime.Parse(XmlUtil.GetAttribute("interval", agentNode));

                            if (interval.Equals(DateTime.Today))
                            {
                                activeFlag = false;
                            }

                            var agentObject = new AgentDetails
                            {
                                AgentName = XmlUtil.GetAttribute("name", agentNode),
                                Interval = XmlUtil.GetAttribute("interval", agentNode),
                                Status = activeFlag ? "Active" : "<font style='color:red'>Disable</font>"
                            };

                            agentList.Add(agentObject);

                            activeFlag = true;
                        }
                    }
                    catch (Exception ex)
                    {
                        Console.Write(ex.Message);
                    }
                }

                return agentList;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }

    public class AgentDetails
    {
        public string AgentName { get; set; }

        public string Interval { get; set; }

        public string Status { get; set; }
    }
}