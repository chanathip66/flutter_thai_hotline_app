import 'package:flutter/material.dart';

import '../widgets/hotline_tile.dart';

class SubCHomeUI extends StatefulWidget {
  const SubCHomeUI({super.key});

  @override
  State<SubCHomeUI> createState() => _SubCHomeUIState();
}

class _SubCHomeUIState extends State<SubCHomeUI> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(top: 10, bottom: 16),
      children: const [
        HotlineTile(
          title: 'ธนาคารกรุงเทพ',
          subtitle: 'Bangkok Bank',
          phone: '1333',
          leadingAsset: 'assets/icon/BBL.png',
        ),
        HotlineTile(
          title: 'ธนาคารออมสิน',
          subtitle: 'GSB Contact Center',
          phone: '1115',
          leadingAsset: 'assets/icon/GSB.png',
        ),
        HotlineTile(
          title: 'ธนาคารกสิกรไทย',
          subtitle: 'K-Contact Center',
          phone: '02-888-8888',
          leadingAsset: 'assets/icon/KBANK.png',
        ),
        HotlineTile(
          title: 'ธนาคารกรุงไทย',
          subtitle: 'Krungthai Contact Center',
          phone: '02-111-1111',
          leadingAsset: 'assets/icon/KTB.png',
        ),
        HotlineTile(
          title: 'ธนาคารกรุงศรีอยุธยา',
          subtitle: 'Krungsri Call Center',
          phone: '1572',
          leadingAsset: 'assets/icon/BAY.png',
        ),
        HotlineTile(
          title: 'ธนาคารทหารไทยธนชาต',
          subtitle: 'ttb contact center',
          phone: '1428',
          leadingAsset: 'assets/icon/TTB.png',
        ),
        HotlineTile(
          title: 'ธนาคารซิตี้แบงก์',
          subtitle: 'Citibank',
          phone: '1588',
          leadingAsset: 'assets/icon/CITI.png',
        ),
        HotlineTile(
          title: 'ธนาคารแลนด์ แอนด์ เฮ้าส์',
          subtitle: 'LH Bank',
          phone: '1327',
          leadingAsset: 'assets/icon/LHB.png',
        ),
        HotlineTile(
          title: 'ธนาคารอาคารสงเคราะห์',
          subtitle: 'G H Bank',
          phone: '02-645-9000',
          leadingAsset: 'assets/icon/GHB.png',
        ),
        HotlineTile(
          title: 'ธนาคารไทยพาณิชย์',
          subtitle: 'SCB Easy Call Center',
          phone: '02-777-7777',
          leadingAsset: 'assets/icon/SCB.png',
        ),
        HotlineTile(
          title: 'ธนาคารเกียรตินาคินภัทร',
          subtitle: 'KKP Contact Center',
          phone: '02-165-5555',
          leadingAsset: 'assets/icon/KKP.png',
        ),
        HotlineTile(
          title: 'ธนาคารไทยเครดิต',
          subtitle: 'Thai Credit Bank',
          phone: '02-697-5454',
          leadingAsset: 'assets/icon/TCRB.png',
        ),
        HotlineTile(
          title: 'ธนาคารยูโอบี',
          subtitle: 'UOB Call Center',
          phone: '02-285-1555',
          leadingAsset: 'assets/icon/UOB.png',
        ),
        HotlineTile(
          title: 'ธนาคารทิสโก้',
          subtitle: 'Tisco Bank',
          phone: '02-633-6000',
          leadingAsset: 'assets/icon/TISCO.png',
        ),
        HotlineTile(
          title: 'ธนาคารอิสลามแห่งประเทศไทย',
          subtitle: 'Islamic Bank of Thailand',
          phone: '02-204-2766',
          leadingAsset: 'assets/icon/IBANK.png',
        ),
        HotlineTile(
          title: 'ธนาคารซีไอเอ็มบี ไทย',
          subtitle: 'CIMB Thai',
          phone: '02-626-7777',
          leadingAsset: 'assets/icon/CIMB.png',
        ),
      ],
    );
  }
}

