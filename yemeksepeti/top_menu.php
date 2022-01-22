<?php
if (isset($_SESSION["name"])) {
  ?>
   <ul class="nav navbar-nav navbar-right">
	<li><a href="#"><span class="glyphicon glyphicon-user"></span> Hoşgeldiniz <?php echo $_SESSION["name"]; ?> </a></li>
	<li class="active" ><a href="index.php"><span class="glyphicon glyphicon-cutlery"></span> Yemekler </a></li>
	<li><a href="cart.php"><span class="glyphicon glyphicon-shopping-cart"></span> Sepetiniz  (<?php
	  if(isset($_SESSION["cart"])){
	  $count = count($_SESSION["cart"]); 
	  echo "$count"; 
		}
	  else
		echo "0";
	  ?>) </a></li>
	<li><a href="logout.php"><span class="glyphicon glyphicon-log-out"></span> Çıkış </a></li>
  </ul>
<?php        
}
?>