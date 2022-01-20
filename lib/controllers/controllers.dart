import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sholatkiblat/api/api.dart';
import 'package:sholatkiblat/helpers/helpers.dart';
import 'package:sholatkiblat/models/models.dart';

part 'homecontroller.dart';
part 'jadwalcontroller.dart';
part 'kiblatcontroller.dart';
part 'kontencontroller.dart';
part 'onboardingcontroller.dart';
