<?php

// channel : @Sourrce_kade

date_default_timezone_set('Asia/Tehran');
if (!file_exists('madeline.php')) {
copy('https://phar.madelineproto.xyz/madeline.php', 'madeline.php');
}
include 'madeline.php';
$MadelineProto = new \danog\MadelineProto\API('Ahriman.madeline');
$MadelineProto->start();
$time = date('H•i');
try {
  // بیو
  $MadelineProto->account->updateProfile(['about' => "『 ᵃşıʳı ʸᵒʳᵍᵘⁿᵘᵐ 』➲  $time "]);
} catch (\Exception $e) {
  echo "$e";
}
sleep(2);
if (file_exists('MadelineProto.log')) {
 unlink('MadelineProto.log');
}
echo 'ربات فعال شد از کانال ما لذت ببر : @Sourrce_kade';
