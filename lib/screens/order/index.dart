import 'package:flutter/material.dart';
import 'package:userapp/constants/config.dart';
import 'package:userapp/models/appointment.model.dart';
import 'package:userapp/models/response.model.dart';
import 'package:userapp/services/appointment.service.dart';
import 'package:userapp/widgets/appbar.dart';
import 'package:userapp/widgets/general_indicator.dart';
import 'package:userapp/widgets/loading_indicator.dart';
import 'package:userapp/widgets/section_title.dart';

import 'components/order_history_card.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  Map<String, dynamic> query = {
    "userId": userinfo!.id,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text("Orders"),
      ),
      body: Container(
        margin: const EdgeInsets.all(0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 6),
                const SectionTitle(title: "Order History", fontSize: 20),
                const SizedBox(height: 8),
                Divider(thickness: 2, indent: 30, endIndent: 30, color: Colors.grey.shade300),
                const SizedBox(height: 8),
                FutureBuilder<dynamic>(
                  future: fetchAppointments(query: query),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return GeneralIndicator(child: Text(snapshot.error.toString()));
                    }

                    if (snapshot.data is ErrorResponse) {
                      ErrorResponse error = snapshot.data;

                      return GeneralIndicator(child: Text(error.message));
                    }

                    if (snapshot.connectionState != ConnectionState.done) {
                      return const LoadingIndicator();
                    }

                    List<Appointment> appointments = snapshot.data ?? [];

                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      itemCount: appointments.length,
                      itemBuilder: (context, index) {
                        Appointment appointment = appointments[index];

                        return OrderHistoryCard(appointment: appointment);
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
