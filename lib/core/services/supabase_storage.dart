import 'dart:io';

import 'package:fruits_dashboard/core/services/storage_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:path/path.dart' as b;

class SupabaseStorageService implements StorageService {
  static late Supabase _supabase;

  static createBuckets(String bucketName) async {
    var buckets = await _supabase.client.storage.listBuckets();

    bool isBucketExite = false;

    for (var buckte in buckets) {
      if (buckte.id == bucketName) {
        isBucketExite = true;
        break;
      }
    }
    if(!isBucketExite){

      await _supabase.client.storage.createBucket(bucketName);
    }
  }

  static initSupabase() async {
    _supabase = await Supabase.initialize(
      url: 'https://vahoyzetlryagcdlbdbw.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZhaG95emV0bHJ5YWdjZGxiZGJ3Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTczNjcwMDE5MCwiZXhwIjoyMDUyMjc2MTkwfQ.wEF_OkR07ay2S2nP07buAOeHu4T3X4a1xviRn0RMItw',
      // 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZhaG95emV0bHJ5YWdjZGxiZGJ3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzY3MDAxOTAsImV4cCI6MjA1MjI3NjE5MH0.G8rmlPy6WKQeH3Mdf514LirBeyKVSoXKa5q8iYoHplM',
    );
  }

  @override
  Future<String> uploadFile(File file, String path) async {
    String fileName = b.basename(file.path);
    String extensionName = b.extension(file.path);
    var resutl = await _supabase.client.storage
        .from('fruits_image')
        .upload('$path/$fileName.$extensionName', file);
        final String publicUrl = _supabase.client
  .storage
  .from('fruits_image')
  .getPublicUrl('$path/$fileName.$extensionName');


    return resutl;
  }
}
