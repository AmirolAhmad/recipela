CarrierWave.configure do |config| 
  config.fog_credentials = { 
    :provider               => 'AWS', 
    :aws_access_key_id      => 'AKIAJGCAP5DNO5ITBSPQ', 
    :aws_secret_access_key  => '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', 
  } 
  config.fog_directory  = 'recipela'
end 