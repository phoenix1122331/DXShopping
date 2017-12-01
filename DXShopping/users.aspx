<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="users.aspx.cs" Inherits="DXShopping.users" %>

<%@ Register assembly="DevExpress.Web.ASPxTreeList.v17.1, Version=17.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxTreeList" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <dx:ASPxGridView ID="ASPxGridView" runat="server" AutoGenerateColumns="False" DataSourceID="sds_users" KeyFieldName="rowid" Width="100%">
            <SettingsPager Visible="False">
            </SettingsPager>
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <Settings ShowFilterRow="True" />
            <SettingsPopup>
                <EditForm AllowResize="True" HorizontalAlign="WindowCenter" Modal="True" VerticalAlign="WindowCenter" />
            </SettingsPopup>
            <Columns>
                <dx:GridViewCommandColumn ShowClearFilterButton="True" ShowEditButton="True" ShowInCustomizationForm="True" ShowNewButtonInHeader="True" VisibleIndex="0" ShowDeleteButton="True">
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="rowid" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                            <EditFormSettings Visible="False" />
                            <FilterCellStyle Wrap="False">
                            </FilterCellStyle>
                            <HeaderStyle Wrap="False" />
                        </dx:GridViewDataTextColumn>
                    </Columns>
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn Caption="代號" FieldName="mno" ShowInCustomizationForm="True" VisibleIndex="1">
                    <PropertiesTextEdit>
                        <ValidationSettings CausesValidation="True" ErrorText="*" SetFocusOnError="True">
                            <RequiredField ErrorText="代號不可空白!!" IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesTextEdit>
                    <HeaderStyle Wrap="False" />
                    <CellStyle Wrap="False">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="名稱" FieldName="mname" ShowInCustomizationForm="True" VisibleIndex="2">
                    <FilterCellStyle Wrap="False">
                    </FilterCellStyle>
                    <HeaderStyle Wrap="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="mpass" ShowInCustomizationForm="True" Visible="False" VisibleIndex="10">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn Caption="出生日期" FieldName="mbirthday" ShowInCustomizationForm="True" VisibleIndex="4">
                    <PropertiesDateEdit DisplayFormatString="yyyy/MM/dd" EditFormat="Custom" EditFormatString="yyyy/MM/dd">
                    </PropertiesDateEdit>
                    <FilterCellStyle Wrap="False">
                    </FilterCellStyle>
                    <HeaderStyle Wrap="False" />
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn Caption="電子信箱" FieldName="memail" ShowInCustomizationForm="True" VisibleIndex="6">
                    <PropertiesTextEdit>
                        <ValidationSettings CausesValidation="True" ErrorText="*" SetFocusOnError="True">
                            <RegularExpression ErrorText="電子信箱格式錯誤!!" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                            <RequiredField ErrorText="電子信箱不可空白!!" IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesTextEdit>
                    <FilterCellStyle Wrap="False">
                    </FilterCellStyle>
                    <HeaderStyle Wrap="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="基本薪資" FieldName="msalary" ShowInCustomizationForm="True" VisibleIndex="7">
                    <PropertiesTextEdit DisplayFormatString="#,##0">
                    </PropertiesTextEdit>
                    <FilterCellStyle Wrap="False">
                    </FilterCellStyle>
                    <HeaderStyle Wrap="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="備註" FieldName="remark" ShowInCustomizationForm="True" VisibleIndex="9">
                    <FilterCellStyle Wrap="False">
                    </FilterCellStyle>
                    <HeaderStyle Wrap="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="性別" FieldName="mgender" ShowInCustomizationForm="True" VisibleIndex="3">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="女性" Value="F" />
                            <dx:ListEditItem Text="男性" Value="M" />
                        </Items>
                    </PropertiesComboBox>
                    <FilterCellStyle Wrap="False">
                    </FilterCellStyle>
                    <HeaderStyle Wrap="False" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataCheckColumn Caption="啟動" FieldName="isenabled" ShowInCustomizationForm="True" VisibleIndex="5">
                    <FilterCellStyle Wrap="False">
                    </FilterCellStyle>
                    <HeaderStyle Wrap="False" />
                </dx:GridViewDataCheckColumn>
                <dx:GridViewDataTextColumn Caption="全勤獎金" FieldName="fulltime" FixedStyle="Left" ShowInCustomizationForm="True" Visible="False" VisibleIndex="8">
                    <PropertiesTextEdit DisplayFormatString="#,##0">
                    </PropertiesTextEdit>
                    <EditFormCaptionStyle Wrap="False">
                    </EditFormCaptionStyle>
                    <HeaderStyle Wrap="False" />
                    <CellStyle Wrap="False">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
    </div>
    <div>
        <asp:SqlDataSource ID="sds_users" runat="server" ConnectionString="<%$ ConnectionStrings:dbconn %>" DeleteCommand="DELETE FROM [user] WHERE [rowid] = @rowid" InsertCommand="INSERT INTO [user] ([mno], [mname], [mpass], [mgender], [mbirthday], [isenabled], [memail], [msalary], [remark]) VALUES (@mno, @mname, @mpass, @mgender, @mbirthday, @isenabled, @memail, @msalary, @remark)" SelectCommand="SELECT * FROM [user] ORDER BY [mno]" UpdateCommand="UPDATE [user] SET [mno] = @mno, [mname] = @mname, [mpass] = @mpass, [mgender] = @mgender, [mbirthday] = @mbirthday, [isenabled] = @isenabled, [memail] = @memail, [msalary] = @msalary, [remark] = @remark WHERE [rowid] = @rowid">
            <DeleteParameters>
                <asp:Parameter Name="rowid" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="mno" Type="String" />
                <asp:Parameter Name="mname" Type="String" />
                <asp:Parameter Name="mpass" Type="String" />
                <asp:Parameter Name="mgender" Type="String" />
                <asp:Parameter DbType="Date" Name="mbirthday" />
                <asp:Parameter Name="isenabled" Type="Int32" />
                <asp:Parameter Name="memail" Type="String" />
                <asp:Parameter Name="msalary" Type="Int32" />
                <asp:Parameter Name="remark" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="mno" Type="String" />
                <asp:Parameter Name="mname" Type="String" />
                <asp:Parameter Name="mpass" Type="String" />
                <asp:Parameter Name="mgender" Type="String" />
                <asp:Parameter DbType="Date" Name="mbirthday" />
                <asp:Parameter Name="isenabled" Type="Int32" />
                <asp:Parameter Name="memail" Type="String" />
                <asp:Parameter Name="msalary" Type="Int32" />
                <asp:Parameter Name="remark" Type="String" />
                <asp:Parameter Name="rowid" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
