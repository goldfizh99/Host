﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="reviews.aspx.cs" Inherits="NewVersion.admin.reviews" %>

<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
    <asp:SqlDataSource
    ID="SqlDataSource1"
    runat="server"
    ConnectionString="<%$ ConnectionStrings:productConnectionString %>"
    SelectCommand="SELECT * FROM [Review]">
    </asp:SqlDataSource>

    <div class="col-md-12">
        <div class="card">
            <div class="card-body">
                <div class="table-responsive">
                    <table
                        id="add-row"
                        class="display table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>Review ID</th>
                                <th>Review Date</th>
                                <th>Review Rating</th>
                                <th>Review Image</th>
                                <th>Review Description</th>
                            </tr>
                        </thead>
                         <tbody>
                            <asp:Repeater ID="ReviewRepeater" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td><%# Eval("ReviewID") %></td>
                                        <td><%# Eval("ReviewDate", "{0:yyyy-MM-dd}") %></td>
                                        <td><%# Eval("ReviewRating") %></td>
                                        <td>
                                            <img src='<%# Eval("ReviewImageURL") %>' alt="Review Image" style="width:50px;height:50px;" />
                                        </td>
                                        <td><%# Eval("ReviewDescription") %></td>
                                        <td>
                                            <div class="form-button-action">
                                                <asp:LinkButton runat="server" CssClass="btn btn-link btn-danger" 
                                                    CommandName="DeleteReview" 
                                                    CommandArgument='<%# Eval("ReviewID") %>' 
                                                    ToolTip="Remove" 
                                                    OnClientClick="return confirm('Are you sure you want to delete this review?');">
                                                    <i class="fa fa-times"></i>
                                                </asp:LinkButton>
                                            </div>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
