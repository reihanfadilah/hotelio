import 'package:course_hotelio/config/app_asset.dart';
import 'package:course_hotelio/config/app_color.dart';
import 'package:course_hotelio/config/app_format.dart';
import 'package:course_hotelio/config/app_route.dart';
import 'package:course_hotelio/model/booking.dart';
import 'package:course_hotelio/source/booking_source.dart';
import 'package:course_hotelio/widget/button_custom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

import '../controller/c_user.dart';
import '../model/hotel.dart';

class CheckoutPage extends StatelessWidget {
  CheckoutPage({super.key});

  final cUser = Get.put(CUser());

  @override
  Widget build(BuildContext context) {
    Hotel hotel = ModalRoute.of(context)!.settings.arguments as Hotel;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        title: Text(
          'Checkout',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          header(hotel, context),
          SizedBox(
            height: 16,
          ),
          roomDetails(context),
          SizedBox(
            height: 16,
          ),
          paymentMethod(context),
          SizedBox(
            height: 20,
          ),
          ButtonCustom(
              label: 'Procced to Payment',
              isExpand: true,
              onTap: () {
                BookingSource.addBooking(
                  cUser.data.id!,
                  Booking(
                    id: '',
                    idHotel: hotel.id,
                    cover: hotel.cover,
                    name: hotel.name,
                    location: hotel.location,
                    date: DateFormat('yyyy-MM-dd').format(DateTime.now()),
                    guest: 1,
                    breakfast: 'Include',
                    checkInTime: '08.00 WIB',
                    night: 2,
                    serviceFee: 6,
                    activities: 40,
                    totalPayment: hotel.price + 2 + 6 + 40,
                    status: 'PAID',
                    isDone: false,
                  ),
                );
                Navigator.pushNamed(context, AppRoute.checkoutSuccess,arguments: hotel);
              }
              )
        ],
      ),
    );
  }

  Container paymentMethod(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Payment Method',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.grey[300]!),
            ),
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Image.asset(
                  AppAsset.iconMasterCard,
                  width: 50,
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Elliot York Owell',
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Balance ${AppFormat.currency(80000)}',
                        style: const TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.check_circle,
                  color: AppColor.secondary,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container roomDetails(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Room Details',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(
            height: 16,
          ),
          itemRoomDetail(context, 'Date',
              AppFormat.date(DateTime.now().toIso8601String())),
          const SizedBox(
            height: 8,
          ),
          itemRoomDetail(context, 'Guest', '2 Guest'),
          const SizedBox(
            height: 8,
          ),
          itemRoomDetail(context, 'Breakfast', 'Include'),
          const SizedBox(
            height: 8,
          ),
          itemRoomDetail(context, 'Check-in Time', '14:00 WIB'),
          const SizedBox(
            height: 8,
          ),
          itemRoomDetail(context, '1 night', AppFormat.currency(12900)),
          const SizedBox(
            height: 8,
          ),
          itemRoomDetail(context, 'Service fee', AppFormat.currency(50)),
          const SizedBox(
            height: 8,
          ),
          itemRoomDetail(context, 'Activities', AppFormat.currency(350)),
          const SizedBox(
            height: 8,
          ),
          itemRoomDetail(context, 'Total Payment', AppFormat.currency(13550)),
          const SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }

  Row itemRoomDetail(BuildContext context, String title, String data) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Text(
          data,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontWeight: FontWeight.bold),
        )
      ],
    );
  }

  Container header(Hotel hotel, BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              hotel.cover,
              fit: BoxFit.cover,
              height: 70,
              width: 90,
            ),
          ),
          SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  hotel.name,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  hotel.location,
                  style: const TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w300),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
