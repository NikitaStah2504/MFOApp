//
//  FirstLoanView.swift
//  MFOApp
//
//  Created by Nikita Stshovsky on 19.06.2023.
//

import SwiftUI
import InputMask
struct FirstLoanView: View {
  @State
  private var total: Double = 0.0
  @State
  private var days: Double = 0.0
  @State
  private var agreement: Bool = false
  @State
  private var searchAdd: Bool = false
  @State
  private var showMessage: Bool = false
  @State
  private var phone = ""
  @State
  private var phoneComplete = false
  
  @EnvironmentObject var viewModel: LoanViewModel
  
  var body: some View {
    ScrollView(showsIndicators: false) {
      ZStack {
        Image("backImage")
          .resizable()
          .scaledToFill()
          .frame(height: 300)
          .padding(.top, -310)
        VStack {
          VStack(alignment: .center) {
            Text("firstLoan")
              .foregroundColor(.white)
              .font(.system(size: 36, weight: .semibold))
            Text("valueLoan")
              .foregroundColor(.white)
              .font(.system(size: 14, weight: .light))
            HStack {
              Text("currency\(viewModel.loanAmount, specifier: "%.f")")
                .font(.system(size: 36, weight: .semibold))
                .foregroundColor(.white)
                .frame(width: 260, height: 10)
              Button {
                searchAdd.toggle()
              } label: {
                Image("newLoan")
                  .resizable()
                  .scaledToFit()
                  .frame(width: 26, height: 30)
              }
            }
          }.padding(.top, 20)
          VStack {
            UISliderView(value: $viewModel.loanAmount,
                         minValue: Double("fromValue".localized()) ?? 0.0,
                         maxValue: Double("toValue".localized()) ?? 0.0,
                         thumbColor: .white,
                         minTrackColor: .white,
                         maxTrackColor: .gray)
            HStack {
              Text("from")
                .foregroundColor(.white)
              Spacer()
              Text("to")
                .foregroundColor(.white)
            }.padding(.top, 16)
          }.padding(.all, 14)
          VStack {
            textFieldsAuthentication()
              .padding(.top, 60)
            getValueButton()
              .padding(.bottom, 16)
            HStack(spacing: 20) {
              agreementPersonalData()
              Text("agreement")
                .foregroundColor(.black)
            }
          }
        }.padding()
      }
      .fullScreenCover(isPresented: $viewModel.showLoad) {
        LoadView(viewModel: viewModel)
      }
    }.onTapGesture {
      UIApplication.shared.endEditing()
    }
    .alert("alertFirstText".localized(), isPresented: $searchAdd) {
      TextField("", text: $viewModel.searchLoan)
      Button("Ok", action: submit)
      Button("Cancel", role: .cancel) {}
    }
    .alert("alertSecondText".localized(), isPresented: $showMessage) {
      Button("Ok", role: .cancel){}
    }
  }
  
  private func submit() {
    showMessage.toggle()
  }
  
  @ViewBuilder private func getValueButton() -> some View {
    Button {
      if viewModel.textFieldValidatorEmail(viewModel.email) && viewModel.isValidPhone(phone: viewModel.phoneNumber) && agreement {
        viewModel.showLoad.toggle()
        viewModel.showTabBar()
      }
    } label: {
      if viewModel.textFieldValidatorEmail(viewModel.email) && viewModel.isValidPhone(phone: viewModel.phoneNumber) && agreement {
        Text("apply")
          .padding(16)
          .frame(maxWidth: .infinity)
          .background(Color.accentMain)
          .cornerRadius(10)
          .padding(.horizontal, 16)
          .foregroundColor(.white)
      } else {
        Text("apply")
          .padding(16)
          .frame(maxWidth: .infinity)
          .background(Color.gray)
          .cornerRadius(10)
          .padding(.horizontal, 16)
          .foregroundColor(.white)
      }
    }
  }
  
  @ViewBuilder private func textFieldsAuthentication() -> some View {
    VStack(spacing: -20) {
      VStack(alignment: .leading, spacing: 2) {
        Text("name")
          .font(.system(size: 14))
        TextField("", text: $viewModel.name)
          .modifier(TextFieldsModifier())
      }.padding()
      VStack(alignment: .leading, spacing: 2) {
        Text("personalEmail")
          .font(.system(size: 14))
        TextField("", text: $viewModel.email)
          .modifier(TextFieldsModifier())
          .keyboardType(.emailAddress)
      }.padding()
      VStack(alignment: .leading, spacing: 2) {
        Text("phoneNumber")
          .font(.system(size: 14))
        MaskedTextField(
          text: $viewModel.phoneNumber,
          value: $phone,
          complete: $phoneComplete,
          placeholder: "+7 (000) 000-00-00",
          primaryMaskFormat: "+7 ([000]) [000]-[00]-[00]"
        )
        .padding()
        .modifier(TextFieldsModifier())
        .keyboardType(.numberPad)
      }.padding()
    }
  }
  
  @ViewBuilder private func agreementPersonalData() -> some View {
    Button {
      agreement.toggle()
    } label: {
      if agreement {
        Image(systemName: "checkmark")
          .padding(16)
          .frame(width: 20, height: 20)
          .background(Color.accentMain)
          .cornerRadius(6)
          .padding(.horizontal, 16)
          .foregroundColor(.white)
      } else {
        Image(systemName: "")
          .padding(16)
          .cornerRadius(6)
          .foregroundColor(.black)
          .frame(width: 20, height: 20)
          .overlay(
            RoundedRectangle(cornerRadius: 6)
              .stroke(Color.gray, lineWidth: 2)
          )
          .padding(.horizontal, 16)
      }
    }
  }
}


struct FirstLoanView_Previews: PreviewProvider {
  static var previews: some View {
    FirstLoanView().environmentObject(LoanViewModel())
  }
}

