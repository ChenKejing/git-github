
Partial Class TestMenu3
    Inherits System.Web.UI.Page

	Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowDataBound
		If e.Row.RowType = DataControlRowType.DataRow Then
			Dim ds As SqlDataSource = CType(e.Row.FindControl("SqlDataSource2"), SqlDataSource)
			ds.SelectParameters("fkMenuItemID").DefaultValue = GridView1.DataKeys(e.Row.RowIndex).Value
		End If
	End Sub
End Class
