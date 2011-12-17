# Phoenix Engine API

## Authentication
***
<table style="border:1px solid; width:100%">
	<tr>
		<td>
			*URI*
		</td>
		<td>
			*Controller/Action*
		</td>
		<td>
			*HTTP TYPE*
		</td>
		<td>
			*COMMENTS*
		</td>
	</tr>
	<tr>
		<td>
			/login <br /> /users/sign_in
		</td>
		<td>
			sessons/new
		</td>
		<td>
			GET
		</td>
		<td>
			登陆页面
		</td>
	</tr>
</table>

   ||  ||    ||  get  || 
/sessions/create || post  || 登陆  
/signup  || /users/sign_up  || /registers/new || get || 显示注册页面  
/registers/create  ||  post  ||  注册  
/logout   ||  /users/sign_out || post || 注消  

/users/lanvige  ||  get  ||  显示用户social 状态页面  

/users/lanvige/profile || get || 显示用户信息  
/users/lanvige/profile/edit  ||  get || 显示用户profile的编辑页面  
/users/lanvige/profile/update || post || 提交更新  
/users/password/new  ||  get || 显示获取新密码  
/users/password/edit?reset_password_token=ydnTL9VBv6f81whJUKoY  
/users/password/update  ||  post  ||  更新用户密码  
/users/confirmation/new  || get  || 显示重发邮件页面  
/users/confirmation/create  || post  || 提交表单  
/users/confirmation  ||  get  ||  show 方法  || 如果邮箱已验证，出该页面提示。  


实现单实例的url最佳方式是？
resource/
resource/edit
resource/update

## social

