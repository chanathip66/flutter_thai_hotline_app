import 'package:flutter/material.dart';

class HotlineItem {
  const HotlineItem({
    required this.title,
    this.subtitle,
    required this.phone,
    this.leadingIcon,
    this.leadingAsset,
    required this.category,
  });

  final String title;
  final String? subtitle;
  final String phone;
  final IconData? leadingIcon;
  final String? leadingAsset;
  final String category;
}

const allHotlines = <HotlineItem>[
  // หมวดเหตุฉุกเฉิน
  HotlineItem(
    title: 'ตำรวจ',
    subtitle: 'แจ้งเหตุด่วนเหตุร้าย',
    phone: '191',
    leadingAsset: 'assets/icon/emergency/191.png',
    category: 'เหตุฉุกเฉิน',
  ),
  HotlineItem(
    title: 'ดับเพลิง/กู้ภัย',
    subtitle: 'แจ้งเหตุเพลิงไหม้',
    phone: '199',
    leadingAsset: 'assets/icon/emergency/199.png',
    category: 'เหตุฉุกเฉิน',
  ),
  HotlineItem(
    title: 'ตำรวจน้ำ',
    subtitle: 'แจ้งเหตุทางน้ำ',
    phone: '1196',
    leadingAsset: 'assets/icon/emergency/1196.png',
    category: 'เหตุฉุกเฉิน',
  ),
  HotlineItem(
    title: 'ศูนย์ช่วยเหลือสังคม',
    subtitle: 'แจ้งคนหาย/ความรุนแรงในครอบครัว',
    phone: '1300',
    leadingAsset: 'assets/icon/emergency/1300.png',
    category: 'เหตุฉุกเฉิน',
  ),
  HotlineItem(
    title: 'ศูนย์ปลอดภัยคมนาคม',
    subtitle: 'แจ้งเหตุบนท้องถนน',
    phone: '1356',
    leadingAsset: 'assets/icon/emergency/1356.png',
    category: 'เหตุฉุกเฉิน',
  ),
  HotlineItem(
    title: 'สถาบันการแพทย์ฉุกเฉินแห่งชาติ',
    subtitle: 'กู้ชีพฉุกเฉิน 24 ชม.',
    phone: '1669',
    leadingAsset: 'assets/icon/emergency/1669.png',
    category: 'เหตุฉุกเฉิน',
  ),

  // หมวดการเดินทาง
  HotlineItem(
    title: 'กรมทางหลวงชนบท',
    subtitle: 'แจ้งเหตุถนนชนบท',
    phone: '1146',
    leadingAsset: 'assets/icon/transport/1146.png',
    category: 'การเดินทาง',
  ),
  HotlineItem(
    title: 'ตำรวจท่องเที่ยว',
    subtitle: 'ช่วยเหลือนักท่องเที่ยว',
    phone: '1155',
    leadingAsset: 'assets/icon/transport/1155.png',
    category: 'การเดินทาง',
  ),
  HotlineItem(
    title: 'ตำรวจทางหลวง',
    subtitle: 'อุบัติเหตุ/จราจร',
    phone: '1193',
    leadingAsset: 'assets/icon/transport/1193.png',
    category: 'การเดินทาง',
  ),
  HotlineItem(
    title: 'ศูนย์ควบคุมและสั่งการจราจร',
    subtitle: 'บก.02 ตำรวจจราจร',
    phone: '1197',
    leadingAsset: 'assets/icon/transport/1197.png',
    category: 'การเดินทาง',
  ),
  HotlineItem(
    title: 'องค์การขนส่งมวลชนกรุงเทพ (ขสมก.)',
    subtitle: 'สอบถามรถเมล์ ขสมก.',
    phone: '1348',
    leadingAsset: 'assets/icon/transport/1348.png',
    category: 'การเดินทาง',
  ),
  HotlineItem(
    title: 'บริษัท ขนส่ง จำกัด (บขส.)',
    subtitle: 'รถทัวร์ระหว่างจังหวัด',
    phone: '1490',
    leadingAsset: 'assets/icon/transport/1490.png',
    category: 'การเดินทาง',
  ),
  HotlineItem(
    title: 'การทางพิเศษแห่งประเทศไทย (EXAT)',
    subtitle: 'ทางด่วน/ทางพิเศษ',
    phone: '1543',
    leadingAsset: 'assets/icon/transport/1543.png',
    category: 'การเดินทาง',
  ),
  HotlineItem(
    title: 'สายด่วนกรมทางหลวง',
    subtitle: 'แจ้งเหตุถนนทางหลวง',
    phone: '1586',
    leadingAsset: 'assets/icon/transport/1586.png',
    category: 'การเดินทาง',
  ),
  HotlineItem(
    title: 'การรถไฟแห่งประเทศไทย (SRT)',
    subtitle: 'สอบถามรถไฟ/จองตั๋ว',
    phone: '1690',
    leadingAsset: 'assets/icon/transport/1690.png',
    category: 'การเดินทาง',
  ),

  // หมวดธนาคาร
  HotlineItem(title: 'ธนาคารกรุงเทพ', subtitle: 'Bangkok Bank', phone: '1333', leadingAsset: 'assets/icon/BBL.png', category: 'ธนาคาร'),
  HotlineItem(title: 'ธนาคารออมสิน', subtitle: 'GSB Contact Center', phone: '1115', leadingAsset: 'assets/icon/GSB.png', category: 'ธนาคาร'),
  HotlineItem(title: 'ธนาคารกสิกรไทย', subtitle: 'K-Contact Center', phone: '02-888-8888', leadingAsset: 'assets/icon/KBANK.png', category: 'ธนาคาร'),
  HotlineItem(title: 'ธนาคารกรุงไทย', subtitle: 'Krungthai Contact Center', phone: '02-111-1111', leadingAsset: 'assets/icon/KTB.png', category: 'ธนาคาร'),
  HotlineItem(title: 'ธนาคารกรุงศรีอยุธยา', subtitle: 'Krungsri Call Center', phone: '1572', leadingAsset: 'assets/icon/BAY.png', category: 'ธนาคาร'),
  HotlineItem(title: 'ธนาคารทหารไทยธนชาต', subtitle: 'ttb contact center', phone: '1428', leadingAsset: 'assets/icon/TTB.png', category: 'ธนาคาร'),
  HotlineItem(title: 'ธนาคารซิตี้แบงก์', subtitle: 'Citibank', phone: '1588', leadingAsset: 'assets/icon/CITI.png', category: 'ธนาคาร'),
  HotlineItem(title: 'ธนาคารแลนด์ แอนด์ เฮ้าส์', subtitle: 'LH Bank', phone: '1327', leadingAsset: 'assets/icon/LHB.png', category: 'ธนาคาร'),
  HotlineItem(title: 'ธนาคารอาคารสงเคราะห์', subtitle: 'G H Bank', phone: '02-645-9000', leadingAsset: 'assets/icon/GHB.png', category: 'ธนาคาร'),
  HotlineItem(title: 'ธนาคารไทยพาณิชย์', subtitle: 'SCB Easy Call Center', phone: '02-777-7777', leadingAsset: 'assets/icon/SCB.png', category: 'ธนาคาร'),
  HotlineItem(title: 'ธนาคารเกียรตินาคินภัทร', subtitle: 'KKP Contact Center', phone: '02-165-5555', leadingAsset: 'assets/icon/KKP.png', category: 'ธนาคาร'),
  HotlineItem(title: 'ธนาคารไทยเครดิต', subtitle: 'Thai Credit Bank', phone: '02-697-5454', leadingAsset: 'assets/icon/TCRB.png', category: 'ธนาคาร'),
  HotlineItem(title: 'ธนาคารยูโอบี', subtitle: 'UOB Call Center', phone: '02-285-1555', leadingAsset: 'assets/icon/UOB.png', category: 'ธนาคาร'),
  HotlineItem(title: 'ธนาคารทิสโก้', subtitle: 'Tisco Bank', phone: '02-633-6000', leadingAsset: 'assets/icon/TISCO.png', category: 'ธนาคาร'),
  HotlineItem(title: 'ธนาคารอิสลามแห่งประเทศไทย', subtitle: 'Islamic Bank of Thailand', phone: '02-204-2766', leadingAsset: 'assets/icon/IBANK.png', category: 'ธนาคาร'),
  HotlineItem(title: 'ธนาคารซีไอเอ็มบี ไทย', subtitle: 'CIMB Thai', phone: '02-626-7777', leadingAsset: 'assets/icon/CIMB.png', category: 'ธนาคาร'),

  // หมวดสาธารณูปโภค
  HotlineItem(
    title: 'การประปานครหลวง (MWA)',
    subtitle: 'แจ้งน้ำประปาขัดข้อง',
    phone: '1125',
    leadingAsset: 'assets/icon/utility/1125.png',
    category: 'สาธารณูปโภค',
  ),
  HotlineItem(
    title: 'การไฟฟ้าส่วนภูมิภาค (PEA)',
    subtitle: 'แจ้งไฟฟ้าขัดข้อง',
    phone: '1129',
    leadingAsset: 'assets/icon/utility/1129.png',
    category: 'สาธารณูปโภค',
  ),
  HotlineItem(
    title: 'การไฟฟ้านครหลวง (MEA)',
    subtitle: 'แจ้งไฟฟ้าขัดข้อง',
    phone: '1130',
    leadingAsset: 'assets/icon/utility/1130.png',
    category: 'สาธารณูปโภค',
  ),
  HotlineItem(
    title: 'การประปาส่วนภูมิภาค (PWA)',
    subtitle: 'แจ้งน้ำประปาขัดข้อง',
    phone: '1662',
    leadingAsset: 'assets/icon/utility/1162.png',
    category: 'สาธารณูปโภค',
  ),
  HotlineItem(
    title: 'กรมชลประทาน',
    subtitle: 'แจ้งเหตุน้ำ/ประตูระบายน้ำ',
    phone: '1186',
    leadingAsset: 'assets/icon/utility/1186.png',
    category: 'สาธารณูปโภค',
  ),
  HotlineItem(
    title: 'สำนักงานประกันสังคม',
    subtitle: 'สิทธิประกันสังคม',
    phone: '1506',
    leadingAsset: 'assets/icon/utility/1506.png',
    category: 'สาธารณูปโภค',
  ),
];
