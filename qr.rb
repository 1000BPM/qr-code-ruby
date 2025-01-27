require "rqrcode"

user_input = ""

#menu
while user_input != "3"
  puts "What kind of QR code would you like to generate?"
  puts ""
  puts "1. Open a URL"
  puts "2. Send a text message"
  puts ""
  puts "Press 3 to exit"
  puts ""
  user_input = gets.chomp
  pp user_input
    if user_input == "1"
      puts "What is the URL you would like to encode?"
      to_encode = gets.chomp
      puts "What would you like to call the PNG?"
      name_png = gets.chomp
      
    elsif user_input == "2"
      puts "What is the phone number you want to code to send a text message to"
      phone_num = gets.chomp.to_i
      puts "What do you want to populate the message with?"
      text_mess = gets.chomp
      puts "What would you like to call the PNG?"
      name_png = gets.chomp
      to_encode = "SMSTO:#{phone_num}:#{text_mess}"

    elsif user_input == "3"
      puts "Goodbye!"
    else
      puts "Please select an option from the menu"
   end

    if user_input == "1" || user_input == "2"
      qrcode = RQRCode::QRCode.new(to_encode)
      png = qrcode.as_png({:size => 500})
      to_encode = IO.binwrite("#{name_png}.png", png.to_s)
    end
end


# Use the RQRCode::QRCode class to encode some text
#qrcode = RQRCode::QRCode.new("https://en.wikipedia.org/wiki/QR_code")

# Use the .as_png method to create a 500 pixels by 500 pixels image
#png = qrcode.as_png({ :size => 500 })

# Write the image data to a file
#IO.binwrite("sometext.png", png.to_s)

#Text message
#SMSTO:9876543210:Hi Alice! It's
