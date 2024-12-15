<%@page contentType="text/html;charset=gb2312"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>文件上传</title>
</head>

<body>
	<p align="center">上传文件选择</p>
	<form method="post" action="file.action" ENCTYPE="multipart/form-data">
		<input type="hidden" name="opttype" value="fileupload">
		<table width="75%" border="1" align="center">
			<tr>
				<td><div align="center">
						1、 <input type="FILE" name="FILE1" size="30">
					</div></td>
			</tr>
			<tr>
				<td><div align="center">
						2、 <input type="FILE" name="FILE2" size="30">
					</div></td>
			</tr>
			<tr>
				<td>
				    <div align="center">
						3、 <input type="FILE" name="FILE3" size="30">
					</div>
				</td>
			</tr>
			<tr>
				<td><div align="center">
						<input type="submit" name="Submit" value="上传它！">
					</div></td>
			</tr>
		</table>
	</form>
</body>
</html>
