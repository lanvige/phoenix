# Phoenix Engine API

## Authentication
***
<table style="border:1px solid; width:100%">
	<tr>
		<td><strong>URI</strong></td>
		<td><strong>Controller/Action</strong></td>
		<td><strong>HTTP TYPE</strong></td>
		<td><strong>COMMENTS</strong></td>
	</tr>
	<tr>
		<td>/signup <br /> /users/sign_up</td>
		<td>registerations/new</td>
		<td>GET</td>
		<td>Show the register page</td>
	</tr>
	<tr>
		<td>/registerations/create</td>
		<td>registerations/create</td>
		<td>POST</td>
		<td>Register with post data</td>
	</tr>
	<tr>
		<td>/login <br /> /users/sign_in</td>
		<td>sessons/new</td>
		<td>GET</td>
		<td>Login page</td>
	</tr>
	<tr>
		<td>/sessions/create</td>
		<td>sessions/create</td>
		<td>POST</td>
		<td>Post user auth info to make login</td>
	</tr>
	<tr>
		<td>/logout <br /> /users/sign_out</td>
		<td>sessons/destory</td>
		<td>GET</td>
		<td>Logout</td>
	</tr>
	<tr>
		<td>/users/lanvige/profile</td>
		<td>profile/index</td>
		<td>GET</td>
		<td>Show the user's profile</td>
	</tr>
	<tr>
		<td>/users/lanvige/profile/edit</td>
		<td>profile/edit</td>
		<td>GET</td>
		<td>Profile edit page</td>
	</tr>
	<tr>
		<td>/users/lanvige/profile/update</td>
		<td>profile/update</td>
		<td>POST</td>
		<td>Update action of profile</td>
	</tr>
	<tr>
		<td>/users/password/new</td>
		<td>passwords/new</td>
		<td>GET</td>
		<td>Show forgot password page</td>
	</tr>
	<tr>
		<td>/users/password/edit?reset_password_token=</td>
		<td>passwords/update</td>
		<td>POST</td>
		<td>Update action of profile</td>
	</tr>
	<tr>
		<td>/users/confirmation/new</td>
		<td>confirmations/new</td>
		<td>GET</td>
		<td>Show the re-send mail page</td>
	</tr>
	<tr>
		<td>/users/confirmation/update</td>
		<td>confirmations/update</td>
		<td>POST</td>
		<td>Resend the activity mail</td>
	</tr>
		<tr>
		<td>/users/confirmation</td>
		<td>confirmations/show</td>
		<td>GET</td>
		<td>Show this page if user is already activitied!</td>
	</tr>
</table>


实现单实例的url最佳方式是？
resource/
resource/edit
resource/update

## social

/users/lanvige  ||  get  ||  显示用户social 状态页面  