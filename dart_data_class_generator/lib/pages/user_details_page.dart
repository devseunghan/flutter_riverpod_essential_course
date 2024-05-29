import 'package:flutter/material.dart';

import 'package:dart_data_class_generator/models/user.dart';

class UserDetailsPage extends StatelessWidget {
  final User user;
  const UserDetailsPage({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          leading: CircleAvatar(
            child: Text(user.id.toString()),
          ),
          title: Text(user.username)
        )
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('name: ${user.name}'),
                Text('email: ${user.email}'),
                Text('phone ${user.phone}'),
                Text('website: ${user.website}'),
              ],
            ),
          ),
          Container(
            color: Colors.brown[50],
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10
            ),
            child: ShowAddress(address: user.address,),
          ),
          Container(
            color: Colors.amber[50],
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10
            ),
            child: ShowCompany(company: user.company,),
          )
        ],
      ),
    ); 
  }
}

class ShowAddress extends StatelessWidget {
  final Address address;
  const ShowAddress({
    super.key,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Address',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        Text('street: ${address.street}'),
        Text('suite: ${address.suite}'),
        Text('city: ${address.city}'),
        Text('zipcode: ${address.zipcode}'),
        Row(
          children: [
            Text('latitude: ${address.geo.lat}'),
            const SizedBox(width: 10,),
            Text('longtitude: ${address.geo.lng}'),
          ],
        )
      ],
    );
  }
}

class ShowCompany extends StatelessWidget {
  final Company company;
  const ShowCompany({
    super.key,
    required this.company,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Company', 
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        Text('name: ${company.name}'),
        Text('Catch Phrase: ${company.catchPhrase}'),
        Text('bs: ${company.bs}')
      ],
    );
  }
}
