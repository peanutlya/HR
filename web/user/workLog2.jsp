<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'workLog2.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/user/assets/css/bootstrap.min.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/user/assets/font-awesome/4.5.0/css/font-awesome.min.css" />

		<!-- page specific plugin styles -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/user/assets/css/select2.min.css" />

		<!-- text fonts -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/user/assets/css/fonts.googleapis.com.css" />

		<!-- ace styles -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/user/assets/css/ace.min.css" class="ace-main-stylesheet" id="main-ace-style" />

		<link rel="stylesheet" href="${pageContext.request.contextPath}/user/assets/css/ace-skins.min.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/user/assets/css/ace-rtl.min.css" />

		<script src="${pageContext.request.contextPath}/user/assets/js/ace-extra.min.js"></script>


  </head>
  
  <body class="no-skin">
		<div class="main-container ace-save-state" id="main-container">
			<script type="text/javascript">
				try{ace.settings.loadState('main-container')}catch(e){}
			</script>
			<div class="main-content">
				<div class="main-content-inner">
					
					
					<input type="hidden" name="e_num" value="${employee.e_num}">
					<input type="hidden" name="e_name" value="${employee.e_name}">
					<div class="page-content">
						<div class="ace-settings-container" id="ace-settings-container">
						  <div class="ace-settings-box clearfix" id="ace-settings-box">
							  <div class="pull-left width-50">
									<div class="ace-settings-item">
										<input type="checkbox" class="ace ace-checkbox-2 ace-save-state" id="ace-settings-navbar" autocomplete="off" />
										<label class="lbl" for="ace-settings-navbar"> Fixed Navbar</label>
									</div>
								  <div class="ace-settings-item">
										<input type="checkbox" class="ace ace-checkbox-2 ace-save-state" id="ace-settings-breadcrumbs" autocomplete="off" />
										<label class="lbl" for="ace-settings-breadcrumbs"> Fixed Breadcrumbs</label>
									</div>

									<div class="ace-settings-item">
										<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-rtl" autocomplete="off" />
										<label class="lbl" for="ace-settings-rtl"> Right To Left (rtl)</label>
									</div>

									<div class="ace-settings-item">
										<input type="checkbox" class="ace ace-checkbox-2 ace-save-state" id="ace-settings-add-container" autocomplete="off" />
										<label class="lbl" for="ace-settings-add-container">
											Inside
											<b>.container</b>
										</label>
									</div>
								</div><!-- /.pull-left -->

								<div class="pull-left width-50">
									<div class="ace-settings-item">
										<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-hover" autocomplete="off" />
										<label class="lbl" for="ace-settings-hover"> Submenu on Hover</label>
									</div>

									<div class="ace-settings-item">
										<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-compact" autocomplete="off" />
										<label class="lbl" for="ace-settings-compact"> Compact Sidebar</label>
									</div>

									<div class="ace-settings-item">
										<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-highlight" autocomplete="off" />
										<label class="lbl" for="ace-settings-highlight"> Alt. Active Item</label>
									</div>
								</div><!-- /.pull-left -->
							</div><!-- /.ace-settings-box -->
						</div><!-- /.ace-settings-container --><!-- /.page-header -->

					  <div class="row">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->
							  
								<div class="widget-box">
									<div class="widget-header widget-header-blue widget-header-flat">
									  <h4 class="widget-title lighter">${employee.e_name}您好！</h4>
								  </div>

									<div class="widget-body">
										<div class="widget-main">
											<div id="fuelux-wizard-container">
												<div>
													<ul class="steps">
														<li data-step="1" class="active">
															<span class="step">1</span>
															<span class="title">书写工作日志</span>
														</li>

														<li data-step="2">
															<span class="step">2</span>
															<span class="title">确定提交</span>
														</li>

														<li data-step="3">
															<span class="step">3</span>
															<span class="title">成功提交</span>
														</li>
    
    												</ul>
												</div>

												<hr />

												<div class="step-content pos-rel">
													<div class="step-pane active" data-step="1">
														<h3 class="lighter block green">请输入以下内容：</h3>

														<form class="form-horizontal" id="sample-form" action="${pageContext.request.contextPath}/UserServlet?op=addWorkLog" method="post">
															<div class="form-group has-warning">
																<label for="inputWarning" class="col-xs-12 col-sm-3 control-label no-padding-right">已完成的工作</label>

																<div class="col-xs-12 col-sm-9">
																	<span class="block input-icon input-icon-right">

<textarea id="inputWarning" class="width-100" name="w_contentscompleted"></textarea>														
																		<i class="ace-icon fa fa-leaf"></i>
																	</span>
																</div>
																
																
											</div>

														  <div class="form-group has-error">
																<label for="inputError" class="col-xs-12 col-sm-3 col-md-3 control-label no-padding-right">未完成的工作</label>

															<div class="col-xs-12 col-sm-9">
																	<span class="block input-icon input-icon-right">

<textarea id="inputError" class="width-100" name="w_unfinished"></textarea>													
																		<i class="ace-icon fa fa-times-circle"></i>
																	</span>
															  </div>
															</div>

														  <div class="form-group has-success">
																<label for="inputSuccess" class="col-xs-12 col-sm-3 control-label no-padding-right">未完成的原因</label>

															<div class="col-xs-12 col-sm-9">
																	<span class="block input-icon input-icon-right">

<textarea id="inputSuccess" class="width-100" name="w_selfassessment"></textarea>
																													<i class="ace-icon fa fa-check-circle"></i>
																	</span>
															  </div>
															</div>

														  <div class="form-group has-info">
																<label for="inputInfo" class="col-xs-12 col-sm-3 control-label no-padding-right">心情与感想</label>

															<div class="col-xs-12 col-sm-9">
																	<span class="block input-icon input-icon-right">
	<textarea  id="inputInfo" class="width-100" name="w_note"></textarea>																	
																		<i class="ace-icon fa fa-info-circle"></i>
																	</span>
															  </div>
															</div>
</form>
												</div>

													<div class="step-pane" data-step="2">
														<div>
															<div class="alert alert-success">
																<button type="button" class="close" data-dismiss="alert">
																	<i class="ace-icon fa fa-times"></i>
																</button>

																<strong>
																	<i class="ace-icon fa fa-check"></i>
																	都填完了!
																</strong>

																确定一定以及肯定想写的都写好了就选下一步~
																<br />
															</div>

															<div class="alert alert-danger">
																<button type="button" class="close" data-dismiss="alert">
																	<i class="ace-icon fa fa-times"></i>
																</button>

																<strong>
																	<i class="ace-icon fa fa-times"></i>
																	还想再改改…
																</strong>

																等什么，返回上一步啊！
																<br />
															</div>

															<div class="alert alert-warning">
																<button type="button" class="close" data-dismiss="alert">
																	<i class="ace-icon fa fa-times"></i>
																</button>
																<strong>划重点!</strong>

																再下一步就：成功提交”了哦！
																<br />
															</div>

																											</div>
													</div>

													<div class="step-pane" data-step="3">
														<div class="center">
															<h3 class="blue lighter">恭喜！</h3>
				请结束流程！										</div>
													</div>

												</div>
											</div>

											<hr />
											<div class="wizard-actions">
												<button class="btn btn-prev">
													<i class="ace-icon fa fa-arrow-left"></i>
													上一步
												</button>

												<button class="btn btn-success btn-next" data-last="结束">
													下一步
													<i class="ace-icon fa fa-arrow-right icon-on-right"></i>
												</button>
											</div>
										</div><!-- /.widget-main -->
									</div><!-- /.widget-body -->
							  </div>

								<div id="modal-wizard" class="modal">
									<div class="modal-dialog">
										<div class="modal-content">
											<div id="modal-wizard-container">
												
								<div class="modal-footer wizard-actions">
												

												<button class="btn btn-danger btn-sm pull-left" data-dismiss="modal">
													<i class="ace-icon fa fa-times"></i>
													Cancel
												</button>
											</div>
										</div>
									</div>
								</div><!-- PAGE CONTENT ENDS -->
							</div><!-- /.col -->
						</div><!-- /.row -->
					</div><!-- /.page-content -->
				</div>
				
			</div><!-- /.main-content -->

			

		  <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
				<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
			</a>
		</div><!-- /.main-container -->

		<!-- basic scripts -->

		<!--[if !IE]> -->
		<script src="${pageContext.request.contextPath}/user/assets/js/jquery-2.1.4.min.js"></script>

		<!-- <![endif]-->

		<!--[if IE]>
<script src="assets/js/jquery-1.11.3.min.js"></script>
<![endif]-->
		<script type="text/javascript">
			if('ontouchstart' in document.documentElement) document.write("<script src='${pageContext.request.contextPath}/user/assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
		</script>
		<script src="${pageContext.request.contextPath}/user/assets/js/bootstrap.min.js"></script>

		<!-- page specific plugin scripts -->
		<script src="${pageContext.request.contextPath}/user/assets/js/wizard.min.js"></script>
		<script src="${pageContext.request.contextPath}/user/assets/js/jquery.validate.min.js"></script>
		<script src="${pageContext.request.contextPath}/user/assets/js/jquery-additional-methods.min.js"></script>
		<script src="${pageContext.request.contextPath}/user/assets/js/bootbox.js"></script>
		<script src="${pageContext.request.contextPath}/user/assets/js/jquery.maskedinput.min.js"></script>
		<script src="${pageContext.request.contextPath}/user/assets/js/select2.min.js"></script>

		<!-- ace scripts -->
		<script src="${pageContext.request.contextPath}/user/assets/js/ace-elements.min.js"></script>
		<script src="${pageContext.request.contextPath}/user/assets/js/ace.min.js"></script>

		<!-- inline scripts related to this page -->
		<script type="text/javascript">
			jQuery(function($) {
			
				
				
				
				$('[data-rel=tooltip]').tooltip();
			
				$('.select2').css('width','200px').select2({allowClear:true})
				.on('change', function(){
					$(this).closest('form').validate().element($(this));
				}); 
			
			
				var $validation = false;
				$('#fuelux-wizard-container')
				.ace_wizard({
					//step: 2 //optional argument. wizard will jump to step "2" at first
					//buttons: '.wizard-actions:eq(0)'
				})
				.on('actionclicked.fu.wizard' , function(e, info){
					if(info.step == 1 && $validation) {
						if(!$('#validation-form').valid()) e.preventDefault();
					}
				})
				//.on('changed.fu.wizard', function() {
				//})
				.on('finished.fu.wizard', function(e) {
					 var dialog = bootbox.dialog({
						message: "谢谢，您的日志保存成功！", 
						buttons: {
							"success" : {
								"label" : "OK",
								
								"className" : "btn-sm btn-primary"
							}
						}
					});
					$(dialog).on('hidden.bs.modal',function(){
						/* $('#sub').submit(function(){
							
						}) */
						window.location.href="${pageContext.request.contextPath}/user/workLog.jsp";
					})
				}).on('stepclick.fu.wizard', function(e){
					//e.preventDefault();//this will prevent clicking and selecting steps
				});
			
			
				//jump to a step
				/**
				var wizard = $('#fuelux-wizard-container').data('fu.wizard')
				wizard.currentStep = 3;
				wizard.setState();
				*/
			
				//determine selected step
				//wizard.selectedItem().step
			
			
			
				//hide or show the other form which requires validation
				//this is for demo only, you usullay want just one form in your application
				$('#skip-validation').removeAttr('checked').on('click', function(){
					$validation = this.checked;
					if(this.checked) {
						$('#sample-form').hide();
						$('#validation-form').removeClass('hide');
					}
					else {
						$('#validation-form').addClass('hide');
						$('#sample-form').show();
					}
				})
			

				$.mask.definitions['~']='[+-]';
				$('#phone').mask('(999) 999-9999');
			
				jQuery.validator.addMethod("phone", function (value, element) {
					return this.optional(element) || /^\(\d{3}\) \d{3}\-\d{4}( x\d{1,6})?$/.test(value);
				}, "Enter a valid phone number.");

				
				
				
				/**
				$('#date').datepicker({autoclose:true}).on('changeDate', function(ev) {
					$(this).closest('form').validate().element($(this));
				});
				
				$('#mychosen').chosen().on('change', function(ev) {
					$(this).closest('form').validate().element($(this));
				});
				*/
				
				
				$(document).one('ajaxloadstart.page', function(e) {
					//in ajax mode, remove remaining elements before leaving page
					$('[class*=select2]').remove();
				});
			})
		</script>
	</body>
</html>
