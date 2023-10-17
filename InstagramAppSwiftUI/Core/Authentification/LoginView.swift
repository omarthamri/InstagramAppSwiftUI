//
//  LoginView.swift
//  InstagramAppSwiftUI
//
//  Created by omar thamri on 17/10/2023.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    var body: some View {
        NavigationStack{
            VStack{
                Spacer()
                //logo Image
                Image("Instagram_Logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width:220,height:100)
                // Text Fields
                VStack {
                    TextField("Enter your email", text: $email)
                        .textInputAutocapitalization(.none)
                        .font(.subheadline)
                        .padding(12)
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.horizontal,24)
                    SecureField("Enter your password", text: $password)
                        .font(.subheadline)
                        .padding(12)
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.horizontal,24)
                }
                Button(action: {
                    print("show forgot password")
                }, label: {
                    Text("Forgot Password?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.trailing,28)
                })
                .frame(maxWidth: .infinity,alignment: .trailing)
                Button(action: {
                    print("login")
                }, label: {
                    Text("Login")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width:360,height: 44)
                        .background(Color(.systemBlue))
                        .cornerRadius(8)
                })
                .padding(.vertical)
                HStack {
                    Rectangle()
                        .frame(width: UIScreen.main.bounds.width / 2 - 40, height: 0.5)
                    Text("OR")
                        .font(.footnote)
                        .fontWeight(.semibold)
                    Rectangle()
                        .frame(width: UIScreen.main.bounds.width / 2 - 40, height: 0.5)
                }
                .foregroundColor(.gray)
                HStack {
                    Image("Facebook_Logo")
                        .resizable()
                        .frame(width: 20,height: 20)
                    Text("Continue with Facebook")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundColor(Color(.systemBlue))
                }
                .padding(.top,8)
                Spacer()
                Divider()
                NavigationLink {
                    Text("sign up")
                } label: {
                    HStack(spacing: 3){
                        Text("Don't have an account?")
                        Text("Sign Up")
                            .fontWeight(.semibold)
                    }
                    .font(.footnote)
                }
                .padding(.vertical,16)
            }
        }
    }
}

#Preview {
    LoginView()
}
