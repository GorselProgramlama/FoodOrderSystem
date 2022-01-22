<?php 
include_once 'config/Database.php';
include_once 'class/Customer.php';

$database = new Database();
$db = $database->getConnection();

$customer = new Customer($db);

if($customer->loggedIn()) {	
	header("Location: index.php");	
}

$loginMessage = '';
if(!empty($_POST["login"]) && !empty($_POST["email"]) && !empty($_POST["password"])) {	
	$customer->email = $_POST["email"];
	$customer->password = $_POST["password"];	
		if($customer->login()) {
		header("Location: index.php");	
	} else {
		$loginMessage = 'Geçersiz tekrar deneyin';
	}
} else {
	$loginMessage = '';
}


include('inc/header.php');
?>
<title>YEMEKSEPETİ</title>
<?php include('inc/container.php');?>
<div class="content"> 
	<div class="container-fluid">			
        <div class="col-md-6">                    
		<div class="panel panel-info">
			<div class="panel-heading" style="background:#5bc0de;color:white;">
				<div class="panel-title">Giriş Paneli</div>                        
			</div> 
			<div style="padding-top:30px" class="panel-body" >
				<?php if ($loginMessage != '') { ?>
					<div id="login-alert" class="alert alert-danger col-sm-12"><?php echo $loginMessage; ?></div>                            
				<?php } ?>
				<form id="loginform" class="form-horizontal" role="form" method="POST" action="">                                    
					<div style="margin-bottom: 25px" class="input-group">
						<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
						<input type="text" class="form-control" id="email" name="email" value="<?php if(!empty($_POST["email"])) { echo $_POST["email"]; } ?>" placeholder="email" style="background:white;" required>                                        
					</div>                                
					<div style="margin-bottom: 25px" class="input-group">
						<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
						<input type="password" class="form-control" id="password" name="password" value="<?php if(!empty($_POST["password"])) { echo $_POST["password"]; } ?>" placeholder="password" required>
					</div>						
					
					<div style="margin-top:10px" class="form-group">                               
						<div class="col-sm-12 controls">
						  <input type="submit" name="login" value="Giriş" class="btn btn-info">	
						  <input type="button" onClick="location.href='signup.php'"name="register" value="Kayıt Ol" class="btn btn-info" >					  
						</div>						
					</div>					
					
					
				</form>   
			</div>                     
		</div>  
	</div>       
    </div>        
		
<?php include('inc/footer.php');?>
