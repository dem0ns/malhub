<?php

//设定密码
$password = "bin123";

?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head profile="http://gmpg.org/xfn/11">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="Content-Language" content="zh-CN" />
<title>ZIP在线解压 - Bluesea_Bo</title>

<style type="text/css">
<!--
	body{margin:0;padding:0;background:#ccc;font:14px/24px "Microsoft Yahei",Verdana,Geneva,sans-serif;background-color:#CCC}
	#wrapper{width:760px;margin-top:50px;background:#fff;border:5px solid #999;margin-right:auto;margin-bottom:0;margin-left:auto}
	#header{background-color:#d1e27f;color:#FFF;text-align:center;line-height:100px;font-size:24px;margin-bottom:30px}
	#header h1{font:20px/30px Verdana,Geneva,sans-serif;font-weight:bold;text-shadow:0 0 1px #DDD;text-align:center}
	#main{margin:20px}
	#footer{text-align:center;font-size:12px;color:#666;position:relative;border-top-width:1px;border-top-style:solid;border-top-color:#d1e27f}
	#footer a{text-decoration:none;color:#666}
	#footer a:hover{text-decoration:underline}
	#eincy{width:82px;height:36px;position:absolute;right:13px;top:20px;background-image:url(Zip_Images/Zip_Logo.png)}
	.todir_01{width:100px}
	.password_01{width:100px}
	.upfile_01{padding:2px;border:2px dashed #CCC;width:142px}
	.Submit_01{width:175px;height:22px;background-color:#d1e27f;border:1px dashed #666;color:#660}
	a:link{
	color: #690;
	text-decoration: none
}
	a:visited{color:#690;text-decoration:none}
	a:hover{color:#660;text-decoration:underline}
	a:active{color:#690;text-decoration:none}
	.shuoming{color:#d1e27f;font-weight:bold;font-style:italic}
	.RAR_ZIP{color:#CCC;font-size:10px}
	.button_01{height:22px;background-color:#D1E27F;border:1px dashed #666;color:#660;}
-->
</style>

</head>
<body>
<div id="wrapper">
	<div id="header">
    	PHP在线解压ZIP工具 - PHPUnZip
    </div>
    <div id="main">
        <form name="myform" method="post" action="<?=$_SERVER[PHP_SELF];?>" enctype="multipart/form-data" onSubmit="return check_uploadObject(this);">
            <?
                if(!$_REQUEST["myaction"]):
            ?>
            
            <script language="javascript">
            function check_uploadObject(form){
                if(form.password.value==''){
                    alert('未填密码,不予解压.');
                    return false;
                }
                return true;
            }
            </script>
    	<p id="choose"> 
            选择文件：<select name="zipfile"><option value="" selected>--- 请选择 ---</option>
            <?
                $fdir = opendir('./');
                while($file=readdir($fdir)){
                    if(!is_file($file)) continue;
                    if(preg_match('/\.zip$/mis',$file)){
                        echo "<option value='$file'>$file</option>\r\n";
                    }
                }
            ?>
            </select>
            &nbsp;&nbsp;[或者]上传文件：
            <input class="upfile_01" name="upfile" type="file" id="upfile" size="20">
        </p>
        <p id="dir">
            解压目录：<input name="todir" type="text" id="todir" class="todir_01" value="" size="15"> 
          <span class="shuoming">（留空为本目录,必须有写入权限）</span> </p>
        <p id="password">
        	密码解压：<input name="password" type="password" id="password" class="password_01" size="15"> 
        </p>
        <p id="unzip">
            <input name="myaction" type="hidden" id="myaction" value="dounzip">
            <input class="Submit_01" type="submit" name="Submit" value=" 开 始 解 压 ">&nbsp;&nbsp;<a href="http://pan.baidu.com/s/1kT3wI" target="_blank">点击下载</a> </p>
        <?
		
		elseif($_REQUEST["myaction"]=="dounzip"):
		
		
		class zip
		{
		
		 var $total_files = 0;
		 var $total_folders = 0; 
		
		 function Extract ( $zn, $to, $index = Array(-1) )
		 {
		   $ok = 0; $zip = @fopen($zn,'rb');
		   if(!$zip) return(-1);
		   $cdir = $this->ReadCentralDir($zip,$zn);
		   $pos_entry = $cdir['offset'];
		
		   if(!is_array($index)){ $index = array($index);  }
		   for($i=0; $index[$i];$i++){
				if(intval($index[$i])!=$index[$i]||$index[$i]>$cdir['entries'])
				return(-1);
		   }
		   for ($i=0; $i<$cdir['entries']; $i++)
		   {
			 @fseek($zip, $pos_entry);
			 $header = $this->ReadCentralFileHeaders($zip);
			 $header['index'] = $i; $pos_entry = ftell($zip);
			 @rewind($zip); fseek($zip, $header['offset']);
			 if(in_array("-1",$index)||in_array($i,$index))
				$stat[$header['filename']]=$this->ExtractFile($header, $to, $zip);
		   }
		   fclose($zip);
		   return $stat;
		 }
		
		  function ReadFileHeader($zip)
		  {
			$binary_data = fread($zip, 30);
			$data = unpack('vchk/vid/vversion/vflag/vcompression/vmtime/vmdate/Vcrc/Vcompressed_size/Vsize/vfilename_len/vextra_len', $binary_data);
		
			$header['filename'] = fread($zip, $data['filename_len']);
			if ($data['extra_len'] != 0) {
			  $header['extra'] = fread($zip, $data['extra_len']);
			} else { $header['extra'] = ''; }
		
			$header['compression'] = $data['compression'];$header['size'] = $data['size'];
			$header['compressed_size'] = $data['compressed_size'];
			$header['crc'] = $data['crc']; $header['flag'] = $data['flag'];
			$header['mdate'] = $data['mdate'];$header['mtime'] = $data['mtime'];
		
			if ($header['mdate'] && $header['mtime']){
			 $hour=($header['mtime']&0xF800)>>11;$minute=($header['mtime']&0x07E0)>>5;
			 $seconde=($header['mtime']&0x001F)*2;$year=(($header['mdate']&0xFE00)>>9)+1980;
			 $month=($header['mdate']&0x01E0)>>5;$day=$header['mdate']&0x001F;
			 $header['mtime'] = mktime($hour, $minute, $seconde, $month, $day, $year);
			}else{$header['mtime'] = time();}
		
			$header['stored_filename'] = $header['filename'];
			$header['status'] = "ok";
			return $header;
		  }
		
		 function ReadCentralFileHeaders($zip){
			$binary_data = fread($zip, 46);
			$header = unpack('vchkid/vid/vversion/vversion_extracted/vflag/vcompression/vmtime/vmdate/Vcrc/Vcompressed_size/Vsize/vfilename_len/vextra_len/vcomment_len/vdisk/vinternal/Vexternal/Voffset', $binary_data);
		
			if ($header['filename_len'] != 0)
			  $header['filename'] = fread($zip,$header['filename_len']);
			else $header['filename'] = '';
		
			if ($header['extra_len'] != 0)
			  $header['extra'] = fread($zip, $header['extra_len']);
			else $header['extra'] = '';
		
			if ($header['comment_len'] != 0)
			  $header['comment'] = fread($zip, $header['comment_len']);
			else $header['comment'] = '';
		
			if ($header['mdate'] && $header['mtime'])
			{
			  $hour = ($header['mtime'] & 0xF800) >> 11;
			  $minute = ($header['mtime'] & 0x07E0) >> 5;
			  $seconde = ($header['mtime'] & 0x001F)*2;
			  $year = (($header['mdate'] & 0xFE00) >> 9) + 1980;
			  $month = ($header['mdate'] & 0x01E0) >> 5;
			  $day = $header['mdate'] & 0x001F;
			  $header['mtime'] = mktime($hour, $minute, $seconde, $month, $day, $year);
			} else {
			  $header['mtime'] = time();
			}
			$header['stored_filename'] = $header['filename'];
			$header['status'] = 'ok';
			if (substr($header['filename'], -1) == '/')
			  $header['external'] = 0x41FF0010;
			return $header;
		 }
		
		 function ReadCentralDir($zip,$zip_name){
			$size = filesize($zip_name);
		
			if ($size < 277) $maximum_size = $size;
			else $maximum_size=277;
			
			@fseek($zip, $size-$maximum_size);
			$pos = ftell($zip); $bytes = 0x00000000;
			
			while ($pos < $size){
				$byte = @fread($zip, 1); $bytes=($bytes << 8) | ord($byte);
				if ($bytes == 0x504b0506 or $bytes == 0x2e706870504b0506){ $pos++;break;} $pos++;
			}
			
			$fdata=fread($zip,18);
			
			$data=@unpack('vdisk/vdisk_start/vdisk_entries/ventries/Vsize/Voffset/vcomment_size',$fdata);
			
			if ($data['comment_size'] != 0) $centd['comment'] = fread($zip, $data['comment_size']);
			else $centd['comment'] = ''; $centd['entries'] = $data['entries'];
			$centd['disk_entries'] = $data['disk_entries'];
			$centd['offset'] = $data['offset'];$centd['disk_start'] = $data['disk_start'];
			$centd['size'] = $data['size'];  $centd['disk'] = $data['disk'];
			return $centd;
		  }
		
		 function ExtractFile($header,$to,$zip){
			$header = $this->readfileheader($zip);
			
			if(substr($to,-1)!="/") $to.="/";
			if($to=='./') $to = '';	
			$pth = explode("/",$to.$header['filename']);
			$mydir = '';
			for($i=0;$i<count($pth)-1;$i++){
				if(!$pth[$i]) continue;
				$mydir .= $pth[$i]."/";
				if((!is_dir($mydir) && @mkdir($mydir,0777)) || (($mydir==$to.$header['filename'] || ($mydir==$to && $this->total_folders==0)) && is_dir($mydir)) ){
					@chmod($mydir,0777);
					$this->total_folders ++;
					echo "<br /><input name='dfile[]' type='checkbox' value='$mydir' checked> <a href='$mydir' target='_blank'>目录: $mydir</a>
		";
				}
			}
			
			if(strrchr($header['filename'],'/')=='/') return;	
		
			if (!($header['external']==0x41FF0010)&&!($header['external']==16)){
				if ($header['compression']==0){
					$fp = @fopen($to.$header['filename'], 'wb');
					if(!$fp) return(-1);
					$size = $header['compressed_size'];
				
					while ($size != 0){
						$read_size = ($size < 2048 ? $size : 2048);
						$buffer = fread($zip, $read_size);
						$binary_data = pack('a'.$read_size, $buffer);
						@fwrite($fp, $binary_data, $read_size);
						$size -= $read_size;
					}
					fclose($fp);
					touch($to.$header['filename'], $header['mtime']);
				}else{
					$fp = @fopen($to.$header['filename'].'.gz','wb');
					if(!$fp) return(-1);
					$binary_data = pack('va1a1Va1a1', 0x8b1f, Chr($header['compression']),
					Chr(0x00), time(), Chr(0x00), Chr(3));
					
					fwrite($fp, $binary_data, 10);
					$size = $header['compressed_size'];
				
					while ($size != 0){
						$read_size = ($size < 1024 ? $size : 1024);
						$buffer = fread($zip, $read_size);
						$binary_data = pack('a'.$read_size, $buffer);
						@fwrite($fp, $binary_data, $read_size);
						$size -= $read_size;
					}
				
					$binary_data = pack('VV', $header['crc'], $header['size']);
					fwrite($fp, $binary_data,8); fclose($fp);
			
					$gzp = @gzopen($to.$header['filename'].'.gz','rb') or die("Cette archive est compress閑");
					if(!$gzp) return(-2);
					$fp = @fopen($to.$header['filename'],'wb');
					if(!$fp) return(-1);
					$size = $header['size'];
				
					while ($size != 0){
						$read_size = ($size < 2048 ? $size : 2048);
						$buffer = gzread($gzp, $read_size);
						$binary_data = pack('a'.$read_size, $buffer);
						@fwrite($fp, $binary_data, $read_size);
						$size -= $read_size;
					}
					fclose($fp); gzclose($gzp);
				
					touch($to.$header['filename'], $header['mtime']);
					@unlink($to.$header['filename'].'.gz');
					
				}
			}
			
			$this->total_files ++;
			echo "<br /><input name='dfile[]' type='checkbox' value='$to$header[filename]' checked> <a href='$to$header[filename]' target='_blank'>文件: $to$header[filename]</a>
		";
		
			return true;
		 }
		
		// end class
		}
		
			set_time_limit(0);
		
			if ($_POST['password'] != $password) die("输入的密码不正确，请重新输入。");
			if(!$_POST["todir"]) $_POST["todir"] = ".";
			$z = new Zip;
			$have_zip_file = 0;
			function start_unzip($tmp_name,$new_name,$checked){
				global $_POST,$z,$have_zip_file;
				$upfile = array("tmp_name"=>$tmp_name,"name"=>$new_name);
				if(is_file($upfile[tmp_name])){
					$have_zip_file = 1;
					echo "
		正在解压: <br /><input name='dfile[]' type='checkbox' value='$upfile[name]' ".($checked?"checked":"")."> $upfile[name]
		
		";
					if(preg_match('/\.zip$/mis',$upfile[name])){
						$result=$z->Extract($upfile[tmp_name],$_POST["todir"]);
						if($result==-1){
							echo "
		文件 $upfile[name] 错误.
		";
						}
						echo "
		<br />完成,共建立 $z->total_folders 个目录,$z->total_files 个文件.
		
		
		";
					}else{
						echo "
		$upfile[name] 不是 zip 文件.
		
		";			
					}
					if(realpath($upfile[name])!=realpath($upfile[tmp_name])){
						@unlink($upfile[name]);
						rename($upfile[tmp_name],$upfile[name]);
					}
				}
			}
			clearstatcache();
			
			start_unzip($_POST["zipfile"],$_POST["zipfile"],0);
			start_unzip($_FILES["upfile"][tmp_name],$_FILES["upfile"][name],1);
		
			if(!$have_zip_file){
				echo "
		请选择或上传文件.
		";
			}
		?>
		<input name="password" type="hidden" id="password" value="<?=$_POST['password'];?>">
		<input name="myaction" type="hidden" id="myaction" value="dodelete"><br />
		<input class="button_01" name="按钮" type="button" value="返回" onClick="window.location='<?=$_SERVER[PHP_SELF];?>';">
		
		<input class="button_01" type='button' value='反选' onclick='selrev();'> <input class="button_01" type='submit' onclick='return confirm("删除选定文件?");' value='删除选定'>
		
		<script language='javascript'>
		function selrev() {
			with(document.myform) {
				for(i=0;i<elements.length;i++) {
					thiselm = elements[i];
					if(thiselm.name.match(/dfile\[]/))	thiselm.checked = !thiselm.checked;
				}
			}
		}
		alert('完成.');
		</script>
		<?
		
		elseif($_REQUEST["myaction"]=="dodelete"):
			set_time_limit(0);
			if ($_POST['password'] != $password) die("输入的密码不正确，请重新输入。");
			
			$dfile = $_POST["dfile"]; 
			echo "正在删除文件...
		
		";
			if(is_array($dfile)){
				for($i=count($dfile)-1;$i>=0;$i--){
					if(is_file($dfile[$i])){
						if(@unlink($dfile[$i])){
							echo "已删除文件: $dfile[$i]
		";
						}else{
							echo "删除文件失败: $dfile[$i]
		";
						}
					}else{
						if(@rmdir($dfile[$i])){
							echo "已删除目录: $dfile[$i]
		";
						}else{
							echo "删除目录失败: $dfile[$i]
		";
						}				
					}
					
				}
			}
			echo "
		完成.
		
		<input type='button' value='返回' onclick=\"window.location='$_SERVER[PHP_SELF]';\">
		
		
				 <script language='javascript'>('完成.');</script>";
		
		endif;
		
		?>
		  </form>
    </div>
    <div id="footer">
    
    	<p>&copy; 2013 <a href="http://www.xi-bo.tk/zip/zip.php">Bluesea_Bo</a><br />
   	    <span class="RAR_ZIP">*&nbsp;遗憾的是它不支持RAR格式在线解压！但使用者可以把文件压缩为ZIP格式&nbsp;*</span>
        </p>
        
        <!-- xi-bo.tk Baidu tongji analytics -->
<script type="text/javascript">
var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3F16d25041c88f4d0ea06b0d042882cd92' type='text/javascript'%3E%3C/script%3E"));
</script>
        
       
   	  <div id="eincy"></div>
    </div>
</div>

</body>
</html>