<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AgentSummary.aspx.cs" Inherits="Sitecore.AgentSummary.sitecore.Admin.AgentSummary" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sitecore Agents Summary</title>
    <style>
        body {
            background: #fafafa url(http://jackrugile.com/images/misc/noise-diagonal.png);
            color: #444;
            font: 100%/30px 'Helvetica Neue', helvetica, arial, sans-serif;
            text-shadow: 0 1px 0 #fff;
        }

        strong {
            font-weight: bold;
        }

        em {
            font-style: italic;
        }

        table {
            background: #f5f5f5;
            border-collapse: separate;
            box-shadow: inset 0 1px 0 #fff;
            font-size: 12px;
            line-height: 24px;
            margin: 30px auto;
            text-align: left;
            width: 800px;
        }

        th {
            background: url(http://jackrugile.com/images/misc/noise-diagonal.png), linear-gradient(#777, #444);
            border-left: 1px solid #555;
            border-right: 1px solid #777;
            border-top: 1px solid #555;
            border-bottom: 1px solid #333;
            box-shadow: inset 0 1px 0 #999;
            color: #fff;
            font-weight: bold;
            padding: 10px 15px;
            position: relative;
            text-shadow: 0 1px 0 #000;
        }

            th:after {
                background: linear-gradient(rgba(255,255,255,0), rgba(255,255,255,.08));
                content: '';
                display: block;
                height: 25%;
                left: 0;
                margin: 1px 0 0 0;
                position: absolute;
                top: 25%;
                width: 100%;
            }

            th:first-child {
                border-left: 1px solid #777;
                box-shadow: inset 1px 1px 0 #999;
            }

            th:last-child {
                box-shadow: inset -1px 1px 0 #999;
            }

        td {
            border-right: 1px solid #fff;
            border-left: 1px solid #e8e8e8;
            border-top: 1px solid #fff;
            border-bottom: 1px solid #e8e8e8;
            padding: 10px 15px;
            position: relative;
            transition: all 300ms;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table>
                <tr>
                    <th>Agent Name</th>
                    <th>Interval</th>
                    <th>Status</th>
                </tr>
                <% foreach (var agent in AgentList)
                   {%>
                <tr>
                    <td><%=agent.AgentName %></td>
                    <td><%=agent.Interval %></td>
                    <td><%=agent.Status %></td>
                </tr>

                <% } %>
            </table>
        </div>
    </form>
</body>
</html>
