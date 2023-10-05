<%@ Page Language="VB" AutoEventWireup="false" MasterPageFile="~/MasterPage.master" CodeFile="AstroHome.aspx.vb" Inherits="AstroHome" Title="Home page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title></title>

        <script src="https://widgets.astronomyapi.com/cdn/astronomy-api-widgets.js"></script>
        <style>
            #frame {
                width: 1100px;
                height: 600px;
                border: 1px solid groove;
            }

        </style>
    </head>
    <body>
        <div id="moon-phase" style="display:inline-block;"></div><br /><br />

        <iframe id="frame" scrolling="no" style="float:left;"></iframe>

        <div id="star-chart" style="width: 800px; margin: 0 auto; float:right;"></div>

        <script>
            const authString = btoa(`${"19aa16ec-4f45-48f1-a566-496c28f75705"}:${"c373beabec4bba656602a2b540e27e902df3fd6388cfdfef69e4f7e3a9d847d33513a1f1c2d7afdb3dd462dd861d5a00f013f059a63d1d444026a7ad92cfe1d57b5454c4d94299d87e126d47595b713e5b6ad7aeeeaa25670479cf47ecddc4d2b3622feee296f5405586eea6c438cc65"}`);
            var today = new Date();
            var dd = String(today.getDate()).padStart(2, '0');
            var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
            var sati = String(today.getHours())
            var minute = String(today.getMinutes())

            if (sati.length == 1) {
                sati = "0"+sati
            }
            if (minute.length == 1) {
                minute = "0" + minute
            }

            var sat_format = sati + minute

            var yyyy = today.getFullYear();

            //console.log(sat_format)

            today = yyyy + '-' + mm + '-' + dd;

            document.getElementById("frame").src = "https://www.timeanddate.com/scripts/sunmap.php?iso=" + yyyy + mm + dd + "T1" + sat_format + "&earth=0";
            document.addEventListener("DOMContentLoaded", function () {
                var client = new AstronomyAPI({
                    basicToken: authString,
                });
                client.moonPhase(
                    {
                        element: "#moon-phase",
                        format: "png",
                        style: {
                            moonStyle: "default",
                            backgroundStyle: "stars",
                            backgroundColor: "red",
                            headingColor: "white",
                            textColor: "white",
                        },
                        observer: {
                            latitude: 45.8150,
                            longitude: 15.9819,
                            date: today,
                        },
                        view: {
                            type: "portrait-simple",
                            "orientation": "south-up"
                        },
                    },
                );

                client.starChart(
                    {
                        element: "#star-chart",
                        style: "default",
                        observer: {
                            latitude: 45.8150,
                            longitude: 15.9819,
                            date: today,
                        },
                        "view": {
                            "type": "area",
                            "parameters": {
                                "position": {
                                    "equatorial": {
                                        "rightAscension": 0,
                                        "declination": 0
                                    }
                                },
                                //"zoom": 1
                            },
                            "orientation": "south-up"
                        }
                    },
                );
            });
        </script>
    </body>
    </html>

</asp:Content>
