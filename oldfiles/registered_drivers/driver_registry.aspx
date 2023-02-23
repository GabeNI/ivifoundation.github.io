<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master"
    CodeFile="driver_registry.aspx.cs" Inherits="regstered_drivers_driver_registry"
    Title="Driver Registry" EnableEventValidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="ComponentArt.Web.UI" Namespace="ComponentArt.Web.UI" TagPrefix="ComponentArt" %>
<asp:Content ID="HeaderContent" ContentPlaceHolderID="HeaderContent" runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
    <link rel="stylesheet" type="text/css" href="../css/newGrid.css" />
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div id="leftCol">
        <p>
            <a runat="server" href="register_driver.aspx">. Register New Drivers</a></p>
        <h3>
            Narrow Results by</h3>
        <asp:Panel ID="pnlOwners" runat="server">
            <asp:UpdatePanel ID="upOwner" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <asp:Panel ID="pnlOwnerHeader" runat="server" CssClass="collapsePanelHeader">
                        <div style="float: left; margin-left: 50px;">
                            <b>Owner</b></div>
                        <div style="float: left; margin-left: 10px;">
                            <asp:Label ID="lblOwner" runat="server"></asp:Label>
                        </div>
                        <br />
                        <div style="margin-left: 50px;">
                            <asp:Label runat="server" ID="Label4" Text="Current Filter:"></asp:Label><br />
                            <asp:Label runat="server" ID="lblOwnerFilter" Font-Italic="true" Text="All Owners"></asp:Label>
                        </div>
                    </asp:Panel>
                    <asp:Panel ID="pnlOwnerDetail" runat="server" CssClass="collapsePanel">
                        <div style="float: left; margin-left: 50px;">
                            <br />
                            <asp:LinkButton ID="LinkButton6" runat="server" CommandName="FilterDriverOwner" CommandArgument='All Owners'
                                OnCommand="Filter_Command">All Owners</asp:LinkButton><br />
                            <asp:LinkButton ID="LinkButton2" runat="server" CommandName="FilterDriverOwner" CommandArgument='My Drivers'
                                OnCommand="Filter_Command">My Drivers</asp:LinkButton><br />
                        </div>
                    </asp:Panel>
                    <div class="line">
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </asp:Panel>
        <asp:UpdatePanel ID="upClass" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <asp:Panel ID="pnlClassHeader" runat="server" CssClass="collapsePanelHeader">
                    <div style="float: left; margin-left: 50px;">
                        <b>Class</b></div>
                    <div style="float: left; margin-left: 10px;">
                        <asp:Label ID="lblClass" runat="server"></asp:Label>
                    </div>
                    <div style="float: right; vertical-align: middle;">
                        <asp:ImageButton ID="imgClassExpand" runat="server" ImageUrl="~/images/expand.jpg"
                            AlternateText="(Show Details...)" />
                    </div>
                    <br />
                    <div style="margin-left: 50px;">
                        <asp:Label runat="server" ID="Label1" Text="Current Filter:"></asp:Label><br />
                        <asp:Label runat="server" ID="lblClassFilter" Font-Italic="true" Text="All Classes"></asp:Label>
                    </div>
                </asp:Panel>
                <asp:Panel ID="pnlClassDetail" runat="server" CssClass="collapsePanel" Style="overflow: hidden"
                    Height="0">
                    <div style="float: left; margin-left: 50px;">
                        <br />
                        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="dsClass" OnItemCommand="Filter_ItemCommand">
                            <HeaderTemplate>
                                <asp:LinkButton ID="LinkButton6" runat="server" CommandName="FilterClass" CommandArgument='All Classes'>All Classes</asp:LinkButton><br />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CommandName="FilterClass" CommandArgument='<%# Server.UrlEncode(DataBinder.Eval(Container.DataItem, "InstrumentClass").ToString())%>'><%# DataBinder.Eval(Container.DataItem, "InstrumentClass")%></asp:LinkButton><br />
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </asp:Panel>
                <ajaxToolkit:CollapsiblePanelExtender ID="cpeClass" runat="Server" TargetControlID="pnlClassDetail"
                    ExpandControlID="pnlClassHeader" CollapseControlID="pnlClassHeader" Collapsed="True"
                    ImageControlID="imgClassExpand" ExpandedText="(Hide Details...)" CollapsedText="(Show Details...)"
                    ExpandedImage="~/images/collapse.jpg" CollapsedImage="~/images/expand.jpg" SuppressPostBack="true" />
                <asp:SqlDataSource ID="dsClass" runat="server" ConnectionString="<%$ ConnectionStrings:IVIFoundationConnectionString %>"
                    SelectCommand="SELECT [InstrumentClass] FROM [InstrumentClass]"></asp:SqlDataSource>
                <div class="line">
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:UpdatePanel ID="upDriverType" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <asp:Panel ID="pnlDriverTypeHeader" runat="server" CssClass="collapsePanelHeader">
                    <div style="float: left; margin-left: 50px;">
                        <b>Driver Type</b></div>
                    <div style="float: left; margin-left: 10px;">
                        <asp:Label ID="lblDriverType" runat="server"></asp:Label>
                    </div>
                    <div style="float: right; vertical-align: middle;">
                        <asp:ImageButton ID="imgDriverTypeExpand" runat="server" ImageUrl="~/images/expand.jpg"
                            AlternateText="(Show Details...)" />
                    </div>
                    <br />
                    <div style="margin-left: 50px;">
                        <asp:Label runat="server" ID="Label3" Text="Current Filter:"></asp:Label><br />
                        <asp:Label runat="server" ID="lblDriverTypeFilter" Font-Italic="true" Text="All Driver Types"></asp:Label></div>
                </asp:Panel>
                <asp:Panel ID="pnlDriverTypeDetail" runat="server" CssClass="collapsePanel" Style="overflow: hidden"
                    Height="0">
                    <div style="float: left; margin-left: 50px;">
                        <br />
                        <asp:Repeater ID="Repeater4" runat="server" DataSourceID="dsDriverType" OnItemCommand="Filter_ItemCommand">
                            <HeaderTemplate>
                                <asp:LinkButton ID="LinkButton6" runat="server" CommandName="FilterDriverType" CommandArgument='All Driver Types'>All Driver Types</asp:LinkButton><br />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CommandName="FilterDriverType" CommandArgument='<%# Server.UrlEncode(DataBinder.Eval(Container.DataItem, "DriverType").ToString())%>'><%# DataBinder.Eval(Container.DataItem, "DriverType")%></asp:LinkButton><br />
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </asp:Panel>
                <ajaxToolkit:CollapsiblePanelExtender ID="CollapsiblePanelExtender3" runat="Server"
                    TargetControlID="pnlDriverTypeDetail" ExpandControlID="pnlDriverTypeHeader" CollapseControlID="pnlDriverTypeHeader"
                    Collapsed="True" ImageControlID="imgDriverTypeExpand" ExpandedText="(Hide Details...)"
                    CollapsedText="(Show Details...)" ExpandedImage="~/images/collapse.jpg" CollapsedImage="~/images/expand.jpg"
                    SuppressPostBack="true" />
                <asp:SqlDataSource ID="dsDriverType" runat="server" ConnectionString="<%$ ConnectionStrings:IVIFoundationConnectionString %>"
                    SelectCommand="SELECT [DriverType] FROM [DriverType]"></asp:SqlDataSource>
                <div class="line">
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:UpdatePanel ID="upManufacturer" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <asp:Panel ID="pnlManufacturerHeader" runat="server" CssClass="collapsePanelHeader">
                    <div style="float: left; margin-left: 50px;">
                        <b>Manufacturer</b></div>
                    <div style="float: left; margin-left: 10px;">
                        <asp:Label ID="lblManufacturer" runat="server"></asp:Label>
                    </div>
                    <div style="float: right; vertical-align: middle;">
                        <asp:ImageButton ID="imgManufacturerExpand" runat="server" ImageUrl="~/images/expand.jpg"
                            AlternateText="(Show Details...)" />
                    </div>
                    <br />
                    <div style="margin-left: 50px;">
                        <asp:Label runat="server" ID="Label6" Text="Current Filter:"></asp:Label><br />
                        <asp:Label runat="server" ID="lblManufacturerFilter" Font-Italic="true" Text="All Manufacturers"></asp:Label></div>
                </asp:Panel>
                <asp:Panel ID="pnlManufacturerDetail" runat="server" CssClass="collapsePanel" Style="overflow: hidden"
                    Height="0">
                    <div style="float: left; margin-left: 50px;">
                        <br />
                        <asp:Repeater ID="Repeater3" runat="server" DataSourceID="dsManufacturer" OnItemCommand="Filter_ItemCommand">
                            <HeaderTemplate>
                                <asp:LinkButton ID="LinkButton6" runat="server" CommandName="FilterManufacturer"
                                    CommandArgument='All Manufacturers'>All Manufacturers</asp:LinkButton><br />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CommandName="FilterManufacturer"
                                    CommandArgument='<%# Server.UrlEncode(DataBinder.Eval(Container.DataItem, "Manufacturer").ToString())%>'><%# Server.HtmlEncode(DataBinder.Eval(Container.DataItem, "Manufacturer").ToString())%></asp:LinkButton><br />
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </asp:Panel>
                <ajaxToolkit:CollapsiblePanelExtender ID="CollapsiblePanelExtender1" runat="Server"
                    TargetControlID="pnlManufacturerDetail" ExpandControlID="pnlManufacturerHeader"
                    CollapseControlID="pnlManufacturerHeader" Collapsed="True" ImageControlID="imgManufacturerExpand"
                    ExpandedText="(Hide Details...)" CollapsedText="(Show Details...)" ExpandedImage="~/images/collapse.jpg"
                    CollapsedImage="~/images/expand.jpg" SuppressPostBack="true" />
                <asp:SqlDataSource ID="dsManufacturer" runat="server" ConnectionString="<%$ ConnectionStrings:IVIFoundationConnectionString %>"
                    SelectCommand="SELECT [Manufacturer] FROM [InstrumentManufacturer]"></asp:SqlDataSource>
                <div class="line">
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:UpdatePanel ID="upVendor" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <asp:Panel ID="pnlVendorHeader" runat="server" CssClass="collapsePanelHeader">
                    <div style="float: left; margin-left: 50px;">
                        <b>Driver Vendor</b></div>
                    <div style="float: left; margin-left: 10px;">
                        <asp:Label ID="lblVendor" runat="server"></asp:Label>
                    </div>
                    <div style="float: right; vertical-align: middle;">
                        <asp:ImageButton ID="imgVendorExpand" runat="server" ImageUrl="~/images/expand.jpg"
                            AlternateText="(Show Details...)" />
                    </div>
                    <br />
                    <div style="margin-left: 50px;">
                        <asp:Label runat="server" ID="Label2" Text="Current Filter:"></asp:Label><br />
                        <asp:Label runat="server" ID="lblVendorFilter" Font-Italic="true" Text="All Driver Vendors"></asp:Label></div>
                </asp:Panel>
                <asp:Panel ID="pnlVendorDetail" runat="server" CssClass="collapsePanel" Style="overflow: hidden"
                    Height="0">
                    <div style="float: left; margin-left: 50px;">
                        <br />
                        <asp:Repeater ID="Repeater2" runat="server" DataSourceID="dsVendor" OnItemCommand="Filter_ItemCommand">
                            <HeaderTemplate>
                                <asp:LinkButton ID="LinkButton6" runat="server" CommandName="FilterDriverVendor"
                                    CommandArgument='All Driver Vendors'>All Driver Vendors</asp:LinkButton><br />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CommandName="FilterDriverVendor"
                                    CommandArgument='<%# Server.UrlEncode(DataBinder.Eval(Container.DataItem, "Vendor").ToString())%>'><%# Server.HtmlEncode(DataBinder.Eval(Container.DataItem, "Vendor").ToString())%></asp:LinkButton><br />
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </asp:Panel>
                <ajaxToolkit:CollapsiblePanelExtender ID="CollapsiblePanelExtender2" runat="Server"
                    TargetControlID="pnlVendorDetail" ExpandControlID="pnlVendorHeader" CollapseControlID="pnlVendorHeader"
                    Collapsed="True" ImageControlID="imgVendorExpand" ExpandedText="(Hide Details...)"
                    CollapsedText="(Show Details...)" ExpandedImage="~/images/collapse.jpg" CollapsedImage="~/images/expand.jpg"
                    SuppressPostBack="true" />
                <asp:SqlDataSource ID="dsVendor" runat="server" ConnectionString="<%$ ConnectionStrings:IVIFoundationConnectionString %>"
                    SelectCommand="SELECT [Vendor] FROM [DriverVendor]"></asp:SqlDataSource>
                <div class="line">
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:UpdatePanel ID="upDriverGeneration" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <asp:Panel ID="pnlDriverGenerationHeader" runat="server" CssClass="collapsePanelHeader">
                    <div style="float: left; margin-left: 50px;">
                        <b>Driver Generation</b></div>
                    <div style="float: left; margin-left: 10px;">
                        <asp:Label ID="lblDriverGeneration" runat="server"></asp:Label>
                    </div>
                    <div style="float: right; vertical-align: middle;">
                        <asp:ImageButton ID="imgDriverGenerationExpand" runat="server" ImageUrl="~/images/expand.jpg"
                            AlternateText="(Show Details...)" />
                    </div>
                    <br />
                    <div style="margin-left: 50px;">
                        <asp:Label runat="server" ID="Label7" Text="Current Filter:"></asp:Label><br />
                        <asp:Label runat="server" ID="lblDriverGenerationFilter" Font-Italic="true" Text="All Driver Generations"></asp:Label></div>
                </asp:Panel>
                <asp:Panel ID="pnlDriverGenerationDetail" runat="server" CssClass="collapsePanel" Style="overflow: hidden"
                    Height="0">
                    <div style="float: left; margin-left: 50px;">
                        <br />
                        <asp:Repeater ID="Repeater5" runat="server" DataSourceID="dsDriverGeneration" OnItemCommand="Filter_ItemCommand">
                            <HeaderTemplate>
                                <asp:LinkButton ID="LinkButton6" runat="server" CommandName="FilterDriverGeneration" CommandArgument='All Driver Generations'>All Driver Generations</asp:LinkButton><br />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CommandName="FilterDriverGeneration" CommandArgument='<%# Server.UrlEncode(DataBinder.Eval(Container.DataItem, "DriverGeneration").ToString())%>'><%# DataBinder.Eval(Container.DataItem, "DriverGeneration")%></asp:LinkButton><br />
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </asp:Panel>
                <ajaxToolkit:CollapsiblePanelExtender ID="CollapsiblePanelExtender5" runat="Server"
                    TargetControlID="pnlDriverGenerationDetail" ExpandControlID="pnlDriverGenerationHeader" CollapseControlID="pnlDriverGenerationHeader"
                    Collapsed="True" ImageControlID="imgDriverGenerationExpand" ExpandedText="(Hide Details...)"
                    CollapsedText="(Show Details...)" ExpandedImage="~/images/collapse.jpg" CollapsedImage="~/images/expand.jpg"
                    SuppressPostBack="true" />
                <asp:SqlDataSource ID="dsDriverGeneration" runat="server" ConnectionString="<%$ ConnectionStrings:IVIFoundationConnectionString %>"
                    SelectCommand="SELECT [DriverGeneration] FROM [DriverGeneration]"></asp:SqlDataSource>
                <div class="line">
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:UpdatePanel ID="upKeyword" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <asp:Panel ID="pnlKeywordHeader" runat="server" CssClass="collapsePanelHeader">
                    <div style="float: left; margin-left: 50px;">
                        <b>Keyword</b></div>
                    <div style="float: left; margin-left: 10px;">
                        <asp:Label ID="lblKeyword" runat="server"></asp:Label>
                    </div>
                    <div style="float: right; vertical-align: middle;">
                        <asp:ImageButton ID="imgKeywordExpand" runat="server" ImageUrl="~/images/expand.jpg"
                            AlternateText="(Show Details...)" />
                    </div>
                    <br />
                    <div style="margin-left: 50px;">
                        <asp:Label runat="server" ID="Label5" Text="Current Filter:"></asp:Label><br />
                        <asp:Label runat="server" ID="lblKeywordFilter" Font-Italic="true" Text="None"></asp:Label></div>
                </asp:Panel>
                <asp:Panel ID="pnlKeywordDetail" runat="server" CssClass="collapsePanel" Style="overflow: hidden"
                    Height="0" DefaultButton="btnSearchKeyword">
                    <div style="float: left; margin-left: 50px;">
                        <br />
                        <asp:LinkButton runat="server" ID="lbRemoveKeyword" Text="Remove Keyword Filter"
                            OnClick="lbRemoveKeyword_Click" /><br />
                        <br />
                        Enter Keyword(s):<br />
                        <table cellpadding="0" cellspacing="0" border="0">
                            <tr>
                                <td align="left">
                                    <asp:TextBox runat="server" ID="tbKeywords" Width="135px" EnableViewState="false" />
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Button runat="server" ID="btnSearchKeyword" Text="Go" OnClick="btnSearchKeyword_Click" />
                                </td>
                            </tr>
                        </table>
                    </div>
                </asp:Panel>
                <ajaxToolkit:CollapsiblePanelExtender ID="CollapsiblePanelExtender4" runat="Server"
                    TargetControlID="pnlKeywordDetail" ExpandControlID="pnlKeywordHeader" CollapseControlID="pnlKeywordHeader"
                    Collapsed="True" ImageControlID="imgKeywordExpand" ExpandedText="(Hide Details...)"
                    CollapsedText="(Show Details...)" ExpandedImage="~/images/collapse.jpg" CollapsedImage="~/images/expand.jpg"
                    SuppressPostBack="true" />
                <div class="line">
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <div id="rightCol">
        <h1>
            Driver Registry</h1>
        <a href="register_driver.aspx" class="registerNew fRight"></a>
        <p class="registry">
            <a href="driver_registry_feed.ashx">
                <img src="../images/rss.gif" alt="RSS Feed" /></a>This page lists the drivers
            registered with the IVI Foundation. Information in this list is updated automatically;
            for concerns or corrections, contact the IVI Foundation.</p>
        <asp:UpdatePanel ID="pnlDrivers" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <ul id="breadcrumb" class="breadcrumb" runat="server" visible="false">
                    <li>
                        <asp:LinkButton ID="lbShowAllDrivers" runat="server" OnClick="lbShowAllDrivers_Click">Show All Drivers</asp:LinkButton></li>
                    <li>|</li>
                    <li id="crumb1" runat="server">crumb1</li>
                    <li id="crumb2" runat="server">crumb2</li>
                    <li id="crumb3" runat="server">crumb3</li>
                    <li id="crumb4" runat="server">crumb4</li>
                    <li id="crumb5" runat="server">crumb5</li>
                    <li id="crumb6" runat="server">crumb6</li>
                </ul>
                <ComponentArt:Grid ID="gvDrivers" DataSourceID="dsDriverRegistry" EnableViewState="true"
                    ShowHeader="False" CssClass="Grid" FooterCssClass="GridFooter" RunningMode="Server"
                    PagerStyle="Numbered" PagerTextCssClass="PagerText" PageSize="18" ImagesBaseUrl="../images/"
                    Width="710" Height="390" OnPageIndexChanged="OnPageIndexChanged" OnSortCommand="OnSortCommand"
                    OnNeedDataSource="OnNeedDataSource" OnNeedRebind="OnNeedRebind" runat="server">
                    <Levels>
                        <ComponentArt:GridLevel DataKeyField="DriverRegistryID" ShowTableHeading="false"
                            ShowSelectorCells="true" SelectorCellCssClass="SelectorCell" SelectorCellWidth="18"
                            SelectorImageUrl="selector.gif" SelectorImageWidth="17" SelectorImageHeight="15"
                            HeadingSelectorCellCssClass="SelectorCell" HeadingCellCssClass="HeadingCell"
                            HeadingRowCssClass="HeadingRow" HeadingTextCssClass="HeadingCellText" DataCellCssClass="DataCell"
                            RowCssClass="Row" SelectedRowCssClass="SelectedRow" SortAscendingImageUrl="asc.gif"
                            SortDescendingImageUrl="desc.gif" SortImageWidth="10" SortImageHeight="10">
                            <Columns>
                                <ComponentArt:GridColumn DataField="DriverRegistryID" HeadingText="ID" Visible="false" />
                                <ComponentArt:GridColumn DataField="Manufacturer" HeadingText="Manufacturer" DataCellServerTemplateId="ManufacturerItemTemplate"
                                    Width="120" />
                                <ComponentArt:GridColumn DataField="InstrumentClass" HeadingText="Instrument Class"
                                    DataCellServerTemplateId="InstrumentClassItemTemplate" Width="120" />
                                <ComponentArt:GridColumn DataField="SupportedModels" HeadingText="Supported Models"
                                    DataCellServerTemplateId="SupportedModelsItemTemplate" Width="120" TextWrap="True" />
                                <ComponentArt:GridColumn DataField="DriverVendor" HeadingText="Vendor" DataCellServerTemplateId="DriverVendorItemTemplate"
                                    Width="120" />
                                <ComponentArt:GridColumn DataField="DriverType" HeadingText="Type" Width="90" />
                                <ComponentArt:GridColumn DataField="DriverGeneration" HeadingText="Generation" Width="80" />
                                <ComponentArt:GridColumn DataField="UserID" HeadingText="Actions" DataCellServerTemplateId="ActionItemTemplate"
                                    Width="50" />
                            </Columns>
                        </ComponentArt:GridLevel>
                    </Levels>
                    <ServerTemplates>
                        <ComponentArt:GridServerTemplate ID="ManufacturerItemTemplate">
                            <Template>
                                <table border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            <%# Container.DataItem["Manufacturer"] %>
                                        </td>
                                    </tr>
                                </table>
                            </Template>
                        </ComponentArt:GridServerTemplate>
                        <ComponentArt:GridServerTemplate ID="InstrumentClassItemTemplate">
                            <Template>
                                <table border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            <%# GetInstrumentClassItemContent(Container.DataItem) %>
                                        </td>
                                    </tr>
                                </table>
                            </Template>
                        </ComponentArt:GridServerTemplate>
                        <ComponentArt:GridServerTemplate ID="SupportedModelsItemTemplate">
                            <Template>
                                <table border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            <%# GetSupportedModelsItemContent(Container.DataItem)%>
                                        </td>
                                    </tr>
                                </table>
                            </Template>
                        </ComponentArt:GridServerTemplate>
                        <ComponentArt:GridServerTemplate ID="DriverVendorItemTemplate">
                            <Template>
                                <table border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            <%# Container.DataItem["DriverVendor"]%>
                                        </td>
                                    </tr>
                                </table>
                            </Template>
                        </ComponentArt:GridServerTemplate>
                        <ComponentArt:GridServerTemplate ID="ActionItemTemplate">
                            <Template>
                                <table border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            <%# GetActionItemContent(Container.DataItem)%>
                                        </td>
                                    </tr>
                                </table>
                            </Template>
                        </ComponentArt:GridServerTemplate>
                    </ServerTemplates>
                </ComponentArt:Grid>
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:SqlDataSource ID="dsDriverRegistry" runat="server" EnableCaching="false" ConnectionString="<%$ ConnectionStrings:IVIFoundationConnectionString %>"
            SelectCommand="SELECT [UserID], [DriverRegistryID], [Manufacturer], [InstrumentClass], [SupportedModels], [DriverVendor], [VendorURL], [DriverType], [DriverGeneration], ISNULL(DATALENGTH([FileContents]), 0) As FileSize FROM [DriverRegistry] ORDER BY [Manufacturer]">
        </asp:SqlDataSource>
    </div>
</asp:Content>