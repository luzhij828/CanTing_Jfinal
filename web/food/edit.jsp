<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/common/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
				<div class="main-content">
					<div class="breadcrumbs" id="breadcrumbs">
						<script type="text/javascript">
							try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
						</script>

						<ul class="breadcrumb" style="display:none;">
							<li>
								<i class="icon-home home-icon"></i>
								<a href="#">Home</a>
							</li>

							<li>
								<a href="#">Tables</a>
							</li>
							<li class="active">Simple &amp; Dynamic</li>
						</ul><!-- .breadcrumb -->

						<div class="nav-search" id="nav-search">
							<form class="form-search">
								<span class="input-icon">
									<input type="text" placeholder="Search ..." class="nav-search-input" id="nav-search-input" autocomplete="off" />
									<i class="icon-search nav-search-icon"></i>
								</span>
							</form>
						</div><!-- #nav-search -->
					</div>

					<div class="page-content">
						<div class="page-header">
							<h1>
								食材管理
								<small>
									<i class="icon-double-angle-right"></i>
									编辑食材
								</small>
							</h1>
						</div><!-- /.page-header -->
						<style>
						.form-group-sm{padding:20px 0;}
						</style>
						<div class="row">
							<form class="form-block" action="${path}/food/update"  method="post" id="form" onsubmit="return checkSub()">
								<div class="form-group form-group-sm">
									<label class="col-sm-2 control-label" >食材名称：</label>
									<div class="col-sm-10">
									  <input name="food.title" id="title" style="width:400px;"class="form-control" type="text"  value="${row.title}">
									</div>
								</div>
								<div class="form-group form-group-sm">
									<label class="col-sm-2 control-label" >类型：</label>
									<div class="col-sm-10">
									  <input name="food.type" class="form-control" style="width:100px;" type="text"  value="${row.type}">
									</div>
								</div>
								<div class="form-group form-group-sm">
									<label class="col-sm-2 control-label" >单位：</label>
									<div class="col-sm-10">
									  <input name="food.unit" class="form-control" style="width:100px;" type="text"  value="${row.unit}">
									</div>
								</div>
								<div class="form-group form-group-sm">
									<label class="col-sm-2 control-label" >重量：</label>
									<div class="col-sm-10">
									  <input name="food.weight" class="form-control" style="width:100px;" type="text"  value="${row.weight}">
									</div>
								</div>
								<div class="form-group form-group-sm">
									<label class="col-sm-2 control-label" >描述：</label>
									<div class="col-sm-10">
									  <textarea name="food.summary" style="width:400px;height:200px;overflow:hidden;">${row.summary}</textarea>
									  
									</div>
								</div>
								<div class="form-group form-group-sm">
									<label class="col-sm-2 control-label" >　</label>
									<div class="col-sm-10">
										<input type="hidden" name="food.id" value="${row.id}" />
									   <button type="submit" class="btn btn-success" style="margin-top:10px;"/>保存</button>
									</div>
								</div>
							</form>
						</div><!-- /.row -->
					</div><!-- /.page-content -->
				</div><!-- /.main-content -->
				<script>
				function IsMobel(str){
					var reg = /^1\d{10}$/;
					return (reg.test(str))
				}
				function checkSub(){
					if($("#title").val()==""){
						alert("名称不能为空")
						return false;
					}
				}
				$(document).ready(function() {
					$("#sub").click(function(){
						if($("#username").val()==""){
							alert("请输入用户名")
							return false;
						}
						if($("#password").val()==""){
							alert("请输入密码")
							return false;
						}
						$(this).val("登陆...")
						$.post("__URL__${path}/login_on",
							$("#form1").serialize(),
							function(data){
								if(data.status==1){
									parent.location.href=data.url;
								}else{
									$("#sub").val("登陆")
									alert(data.info)
								}
							},
						'json');
						return false;
					
					})
					
				})

				</script>
				<%@ include file="/common/footer.jsp"%>
