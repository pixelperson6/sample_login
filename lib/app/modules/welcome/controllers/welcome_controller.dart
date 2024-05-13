import 'package:encrypt/encrypt.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mac_address/mac_address.dart';

import '../../../routes/app_pages.dart';
import 'package:encrypt/encrypt.dart' as encrypt;

class WelcomeController extends GetxController {
  final currentIndex = 0.obs;
  late PageController pageController;

  var incriptedString =
      'U2FsdGVkX1/THfRjhnHR2bMiJfjKq9wO8YbKvt//KhP6XEv8DoOPN3I0IXHR0HZB4YKGZifw+G/+rgRNSHyhlLXJG4XQ/JhqYbkPUosOFp25JqESIjtSomMTJLfuZuQAvCzfB+21mYZtO5pRoZ8Zhv+qxxLtpUs/lB82qae+UkXh6hBQASQZAxxsfdyFcMDBgjNLmOgpV34Pr7FXAJC/R+5mmx1XGIHE00kMll+r2CULT7uYWDiPCF5OElOhRzx5WIBKyYnRGoCN+KZVVKH3yFvxrE+w5GXipuNhP21/xST7Y3R6J5uEu/Jyuhj7sGhG2D0JIX9YxCPxGddLeQD6gjn7RAwtMTS3Q7nKv2E3f1gUf7JbvaFnJX5zvDfDuLXfqFor12LWiLXmnPUmnr++/BbfFOkp8UH3Sq1ONB0Zne43om9ZvEUuikmLx8JAcpGuKR9sArZdQ7EIia3v+QbC85v1AX28lZALZb/12i/uGSjn+GMf+jd5Pw2VZIV8919zQ7Lo8btF2Oc/xptvf3DYxhft/1iOJl5U+avA3dbR+KXmvMFMPqMwoSptNNq3XfOAwmI+KhctwiL92f+oXcJFl65K0W+APEfRxLRz1UVqKx1hV7MGqICHRcNYPpsDIP+pCXotTcu6uaqT1p+KzNX1ED+DqwdW3xY4SvAif9qz4/1n8nNmIWW16GWlVO7KMsO20ns94tlaXjqNmmml43KyB0eJzs0vtqzljh5nmIh+F28uSJ/X/6CL18RglQwJh5pe6tUVIqspQOatLUrusXnJztDsWWq9Wp6/pj/uOBqGNJBw+tUR/6ALwElfkVLNC6d6vF2PyYLsve7eao56jBoaxqw7gpe0/XCcY3NZ2GTaFVSZo5PodhToyzAWrxQg3evGQryyjxOuTVplnup5Ee2/drWBQ+brmKbrxaXkOdNViG6qKMlKhiTCTiL5L9Dm7hpdvBo+Ll0UwC9eBa5luBIGCgMa/Cv8++ncI2i9yCF8ImyttiLkPSDX1la8CmrOMPBH15diFb1pZlQ6PlhMBpnPfil7wWQVLAApko/xMpSoatfNJ8QZZk5OaPfAivNIi2Bg8p3sBk2EMhwCe/KXK5AQ8rFSXrKl91SYoN9YGaFUH7mGUOoeEEVlVINxMYNNeDfo';

  // var incriptedString =
      // 'kqMWbxbN0rE+hQ15oqiSa8DxtusWhyAT+tgBzRngTFsMPn/JnU8/Qr810mBZHLz/iuAuJ1qFrHz88YcEe8ltkuf47Dtftcpq06Y9rz8eBmaZ1KYmQHMv0o+5R//nMi/ur2UgaQCISt2ZpyZrMdP3lNblA4z6M6QbjARmyWVcFDvrZxk1qZQhkszbiyJJmpMe+N4QpC0IJGFCIVYMkz8fJHch6X7o2NqbJWkzvtweEQj+vEk0KYy9WS6t9XDxooE3b2HdJKxjz8a0IMzEGoV7DzbmU3K69yIQM3lDNKbSEArkFs4ELRVjv/eALSHCzE99Ek4rb49BsG4nEpMkrkglgBMRjwKbZ7PWa4/0LWMBs6PUxNnedbMUHz3jxus6+V0g2NGdQl1VF95FGQ4aDgSRtgPAVTQ06lFLglS8iUGHQ/D7kjEpeW0JMCnSUVVBv3lIQ+6qmKCTc1oW4duHdgXCFhHOQ4qL4A91fQCnnNX9LDdpEc4Uazxrm5rxZA/mrHcJMJVY7ZJzhC60RDQ1VRBNkQpWEZwi1RwOMPhfTdGy9r8n5waEucZ0klz8kwHGStaNacJHbVJcNBqaZCVjI46ZvTPDuA5oOHoPrf9nvaz8diT2/C+IcsvrAxF4K/kwxhPMrEYDHpnXTrNK535YZeFVg+5RPiLrECYWDMeb/M4P7GAVjovfmVRvvD1msVPGfMZQx5KpQdllVYUEdVgKhE98Ipml8NV1hO/cwGCntIfkrzEd98alS3zpmCk5VbeK2BbeQ3EZNC68BWoEStPaqH7z5eG/zaLn++KGu9ZTlPE87YprgQ2CCGeHGkTFUvpBi/9SoagloyWzYoe5ZlNiMNfxLL+NRj1IQK92YM6dBctS4LV19u9at7bD4vxSRBm57Sz8QfTGlBVc58xZkZQ3wBcKyQXw1ByhHi6w1LdL6vPv5h54JtHArRSA1YpqCGjem/E8F/En4a3pQ3Dq7hTXTJz7bJw3h3w40AuM4SIGXTHLkK8WrGnVB9jCrzUh4rLWX28iJbFDVXcWE6h/r0cJicq82psR2Eri74y3nvaJ+6nik3Mi40vdRVtcG/0ePFZs1I8Tiyb8qlrBFTjMpy6gKNu75akRtGks2qaFiHF/LUd5er8=';
  // '1Gossozn/tujsRq8YdgSR3OTEE3LPSLQsHFJsqxjWxJuk9GzEPJDom2lDbhH1hwEponjg7ip+bPU/ZgwOEfCiESDa5rmfzZ15j4W5CoFX9qALLwQTAgyzp2mFt/LzjGnmTfs5NRqR+T+pmB1a+615wmyGQKHlIt16qUVnnVe19PflC9TFFulcU/ToEeRFbAcl4lfGB6Jhk86klkMy2z3rOtFw7Vx7ujofTXUUBDo8nbfEOyYMEY5yIT9/NVDazquz9zbpjbY6blV+tZK8m9FSGVn6gLV8j+dYIV6eO89x9wIOCyJpXKvNTh9chEC1y0dEdJSDmvOSPJ4tjpLWU8Ul4+KtgitGQClZFqZw+zlwcuZ5yL9XVpC5QH9EGyx6auN16m5nUkkz2UEKq3epX0Jcsy7Uc/dbQYfBleHlPInbscAZ/MaZFFOP7Gc23wUkJCz+MyZju69IBPfmuEJYFKW906MVWAO7dr4zVlJInbZb0AuW6+K9+dQ8qSJequXcQoOeau/+fAsW9d4/JokK7OkNv8ZrchH+tLm44ZOuFxsc8Q1/aZiBR2B2Rdhuu1MMOGVhRTXPEkiiIcqmAtv9rHz9xF8gVA2TFcxiR+nKCfMWeDyCTFtFNl/aP87CgfDPXFnwStTgcj75EY3aiEGLJ/aGbSqaxLEyXsGMt+3f83bttbTKuAThmfiwEyP7Kw+VnpU9yXIafEz3pjR4L6xV5oyeVEbtUkqSUO7eBfpPu0PWH6+ufmGMXYtYn4ax+t0a5aLEdJSDmvOSPJ4tjpLWU8Ul/lStuhkqQ81I6lybASzMemcrKMLTre6p31UeeoDRYroZT+9FtTkZaGA/tVDi1ccuPJiIEOpTYQNK1MI97seV8x2h1+H5/xKbtgpIQqK0D4eupnYZwu6OC5NsCd6DJxM4wVnSdfvhl9Si6Q5NLgtzLpqVImY6EafFueO5xp185yNm6o8cGiZ3COrQEraZnXJvN/ninOgKVMkd8MuErH+/W+4/CSTICOpNJbfkCNEKtwGDNiWBR7uAeYPHaQOjo4EgYcN82SVoRwRaxhc13417gpofqoX3tnNmqTgNfJVYkl/nX1BN0o/aM8WBi5g/DVCxu4ZJbm9fI/zkhAr64y+vgA=';
  // 'U2FsdGVkX182vN1xR9DR7Z/iXqdIgCnyyrc2iQjFE+9laIiOgL7DpwmlHG8vvmaVUkal1ePmMmbaVMpkMd9ECwCDNiC+R1jJcKMLuEiaVT4XyjCpTrMWNoIzehGigLX5Zvb3/71tTBifsabzFNajmgPRMT4X8ASur2SpR3rQ4Ip+JJSKPAQDZMv4am8luOY42Q56ROH7mKMfjOhM7BThFR3UapfDV4Nw8AN9fBdWXUwau0SiehSirAaKbgSr6Ghi9UtHQaSY0cWI/yQIYLdj3ZqpeFohTj/qqWHHboUBulXuQJOjCxLBw2pRy5vg828AoYYbem6/x5zVrI9WMWA9C5noCOVmJ4ukk3GNp4GdblZ3JPOCon98sm5JzCjnxhyKVaGDaOWi3oiDEfmw1vTI0Xtew6OyjR7cLJeHTG2AFQr+bYKydsWKAVF7WX6CsD1GROeyi4IDizr5JItuMBYZy7l85Uh4DwUZ53QesCSZ1VIBFl+0tQwpP9hnMJyITJWj8tddyMcmczuOd/KgI+HhLbEQBN5zQOuCur161bWvDuZ2ngcpVx82r2i+oah5ZE1Ry4Z58ORphSeG0r1/kBzTjeDCp+2ZOPsvi58qT+eFhVMAtc4MuOIyjT0J03BFYOHpn4+EZBzK2Ri1Vx0q0I/6OoPHlDfdZ3p6Woy1KEA2+I2RtqtCidqJXa7EM1wn0PFrXoHNQb+u6TlaVlHZEv65iHESEZBZXquCmUHo156eC9Q7b6Ioa7if/+QCLxJfQ3IF6XFVkHji7lYXpiPmoPZGfiP+g4ddu608FKSHr1LA2rKNOlsKZ3owvw8ZjGgDzKJx3H3vsnOcLOKJsA7fvbfJuSKmdNWyYctDSgJsefzpTWEQi1dNyoz75inXwOEWOHjlVGTLjEQ9X+ZY5Pj3crEIrMSyrzlwwvJdIPyM5SUgB2xWTl9XcDGaQRWE84kx0ocm0LnHPdz/3xSbdZ8uZsyFu3nonXc5trTEZkXg47KiwNEpp9q4LgdFXuUu4GV9mY+dxn+2M1pzvkrkNos8GPMLqPuEJNUICJxqVZpTe33cMxEQe9sTjowzeXCWTO0a+1pMsQ6BO/7W3FQaW0cRAa88P64jzuxkgvmA4zhqPbRWdnd4aumhHrl9pz5s06NaUjZM';

  @override
  void onInit() async {
    super.onInit();
    pageController = PageController();

    // String platformVersion;
    // // Platform messages may fail, so we use a try/catch PlatformException.
    // try {
    //   platformVersion = await GetMac.macAddress;
    // } on PlatformException {
    //   platformVersion = 'Failed to get Device MAC Address.';
    // }

    // print(platformVersion);

    // final key = encrypt.Key.fromUtf8('privatekey-sybazzar');
    // final iv = encrypt.IV.fromLength(16);
    // IV length = 16
  }

  next() async {
    currentIndex.value++;
    pageController.animateToPage(currentIndex.value,
        duration: const Duration(microseconds: 900), curve: Curves.easeInOut);
  }

  @override
  void onClose() {
    currentIndex.value = 0;
    super.onClose();
  }

  @override
  void onReady() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await GetMac.macAddress;
    } on PlatformException {
      platformVersion = 'Failed to get Device MAC Address.';
    }

    print(platformVersion);
    super.onReady();
  }

  changePageTo(int index) {
    currentIndex.value = index;
    pageController.jumpToPage(currentIndex.value);
  }

  onPageChanged(int index) {
    currentIndex.value = index;
  }

  signup() {
    // Get.toNamed(Routes.SIGNUP);

    final encrypter = Encrypter(AES(
      encrypt.Key.fromUtf8('12345678123456781234567812345678'),
      mode: AESMode.cbc,
    ));
    // final encrypted = encrypter.encrypt(
    //   '{"status":200,"success":true,"data":[{"_id":"5e452f6a754d7382f49d2013","message":"Im  Seller Raibar, hello superadmin","image":"65ba24f174a12a3e812d8f69","unseen_message_count":0,"viewing_for":"seller","sender":"seller","is_seen":true,"added_at":"2024-01-31T10:46:56.001Z","user_name":"Super Admin Waft","user_id":"5e452f6a754d7382f49d2013","user_logo":"public/mr/DC33C1E5EE13FEB-check.webp"},{"_id":"62f0b09c7eca2161dad235c8","message":"Second Message to seller raj from braj","image":null,"unseen_message_count":2,"viewing_for":"seller","sender":"user","is_seen":false,"added_at":"2024-01-31T10:11:22.962Z","user_name":"Buddhi Raj Paudel","user_id":"62f0b09c7eca2161dad235c8","user_logo":"public/mr/DEC980C1A9EE14C-0092C98398254023B844D78BFF2EC71F.jpg"}],"msg":"Seller Chat Data get successfully.","page":1,"size":40,"totalData":1}',
    // );
    var iv = IV.fromSecureRandom(16);
    final decrypted = encrypter.decrypt64(incriptedString , iv: iv);

    print('this will be encrypted');
    // print(encrypted.base64);
    print(decrypted);
  }

  login() {
    Get.toNamed(Routes.SIGNIN);
  }
}
