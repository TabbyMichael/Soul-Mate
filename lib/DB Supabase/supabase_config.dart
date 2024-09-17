import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseConfig {
  static const String supabaseUrl = 'https://ljkbtodkypevccdnshyw.supabase.co/';
  static const String supabaseKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imxqa2J0b2RreXBldmNjZG5zaHl3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjY1Mzc1MzgsImV4cCI6MjA0MjExMzUzOH0.aaNpN8HG5ugHuhMsmKUcUhk4xgdyrIvhuOLqyHdQgUU';

  static final SupabaseClient client = SupabaseClient(supabaseUrl, supabaseKey);
}
