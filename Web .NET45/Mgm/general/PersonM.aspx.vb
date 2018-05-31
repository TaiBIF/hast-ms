Imports System.Drawing
Imports System.Web.Configuration

Partial Class Mgm_general_PersonM
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        sqldsDescription.ConnectionString = WebConfigurationManager.ConnectionStrings("HASTDBConnectionString").ConnectionString
        sqldsDescription.SelectCommand = "SELECT * FROM [person] WHERE ([lastName] = @lastName) ORDER BY [firstName]"
        sqldsDescription.UpdateCommand = "UPDATE [person] SET [lastName] = @lastName, [firstName] = @firstName, [nameC] = @nameC, [organAbbr] = @organAbbr, [collector] = @collector, [identifier] = @identifier, [imageAuthor] = @imageAuthor, [updateDate] = getdate() WHERE [pid] = @pid"

        Dim ctlLastName As New ControlParameter("lastName", "DropDownList1", "SelectedValue")

        '     Dim parameterUpdateDate As New Parameter("updateDate", TypeCode.DateTime, Date.Now.ToString)


        If Not IsPostBack Then

            setFields()
            setGridViewStyle()
            sqldsDescription.SelectParameters.Add(ctlLastName)

        End If

        GridView1.DataSourceID = sqldsDescription.ID

        FormView1.Visible = False


    End Sub


    Protected Sub setFields()


        '建立命令欄位
        Dim editField As New CommandField
        editField.ButtonType = ButtonType.Button
        editField.ShowEditButton = True
        editField.ShowCancelButton = True
        editField.EditText = "編輯"
        editField.UpdateText = "更新"
        editField.CancelText = "取消"
        editField.ItemStyle.Wrap = False



        '建立資料繫結欄位
        Dim lastNameField As New BoundField()
        Dim firstNameField As New BoundField()
        Dim nameCField As New BoundField()
        Dim nameAbbrField As New BoundField()
        Dim organAbbrField As New BoundField()
        Dim collectorField As New CheckBoxField
        Dim identifierField As New CheckBoxField
        Dim imageAuthorField As New CheckBoxField
        Dim updateDateField As New BoundField()

        lastNameField.DataField = "lastName"
        lastNameField.HeaderText = "Last Name"
        lastNameField.ItemStyle.Wrap = False

        firstNameField.DataField = "firstName"
        firstNameField.HeaderText = "First Name"
        firstNameField.ItemStyle.Wrap = False

        nameCField.DataField = "nameC"
        nameCField.HeaderText = "中文名"
        nameCField.ItemStyle.Wrap = False

        nameAbbrField.DataField = "nameAbbr"
        nameAbbrField.HeaderText = "代號"
        nameAbbrField.ItemStyle.Wrap = False

        organAbbrField.DataField = "organAbbr"
        organAbbrField.HeaderText = "所屬單位"
        organAbbrField.ItemStyle.Wrap = False

        collectorField.DataField = "collector"
        collectorField.HeaderText = "採集者"
        collectorField.ItemStyle.Wrap = False

        identifierField.DataField = "identifier"
        identifierField.HeaderText = "鑑訂者"
        identifierField.ItemStyle.Wrap = False

        imageAuthorField.DataField = "imageAuthor"
        imageAuthorField.HeaderText = "影像作者"
        imageAuthorField.ItemStyle.Wrap = False

        updateDateField.DataField = "updateDate"
        updateDateField.HeaderText = "修改日期"
        updateDateField.ItemStyle.Wrap = False
        updateDateField.ReadOnly = True
        updateDateField.DataFormatString = "{0:d}"

        GridView1.Columns.Add(editField)
        GridView1.Columns.Add(lastNameField)
        GridView1.Columns.Add(firstNameField)
        GridView1.Columns.Add(nameCField)
        GridView1.Columns.Add(nameAbbrField)
        GridView1.Columns.Add(organAbbrField)
        GridView1.Columns.Add(collectorField)
        GridView1.Columns.Add(identifierField)
        GridView1.Columns.Add(imageAuthorField)
        GridView1.Columns.Add(updateDateField)

    End Sub


    Protected Sub setGridViewStyle()

        GridView1.AutoGenerateColumns = False

        Dim KeyName() As String = {"pid"}
        GridView1.DataKeyNames = KeyName

        GridView1.AllowPaging = True
        GridView1.AllowSorting = False
        GridView1.Font.Size = 12
        GridView1.GridLines = GridLines.Both
        GridView1.PageSize = 20

        GridView1.PagerSettings.Position = PagerPosition.Bottom
        GridView1.PagerStyle.HorizontalAlign = HorizontalAlign.Center


    End Sub


    Protected Sub GridView1_SelectedIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewSelectEventArgs) Handles GridView1.SelectedIndexChanging

        '判斷目前是否處於編輯模式(EditIndex為1)，禁止選擇換列
        If (Not GridView1.EditIndex = -1) Then
            GridView1.SelectedIndex = -1
            e.Cancel = True
            'Dim myMsg As New AlertMessage()
            ' myMsg.showMsg(Me.Page, "編輯模式下禁止選擇換列！")
        End If


    End Sub


    Protected Sub btnInsert_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnInsert.Click

        GridView1.Visible = False
        FormView1.Visible = True

        btnInsert.Visible = False

    End Sub

    Protected Sub FormView1_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertedEventArgs) Handles FormView1.ItemInserted

        'Dim myMsg As New AlertMessage
        FormView1.Visible = False

        'myMsg.showMsg(Me.Page, "資料新增成功！")

        DropDownList1.DataBind()

        btnInsert.Visible = True

    End Sub

    Protected Sub FormView1_ItemCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewCommandEventArgs) Handles FormView1.ItemCommand


    End Sub

    Protected Sub InsertCancelButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)

        FormView1.Visible = False

        btnInsert.Visible = True


    End Sub

    Protected Sub DropDownList1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList1.SelectedIndexChanged

        GridView1.Visible = True

    End Sub

End Class
