import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form"

export default class extends Controller {
  static targets = ['startYear', 'endYear', 'year', 'month']
 

 
   connect() {
     this.updateFields()
   }
 
   updateFields() {
    console.log("foo")
    const yearField = document.querySelector('#yearField');
    console.log(yearField)

  yearField.style.display = 'none';

    const selectedOption = this.element.value
    console.log(selectedOption)
     if (selectedOption === 'Range_across_years') {
       this.startYearTarget.style.display = 'inline-block'
       this.endYearTarget.style.display = 'inline-block'
       this.yearTarget.style.display = 'none'
     } else if (selectedOption === 'Compare_one_month_across_years') {
       this.startYearTarget.style.display = 'none'
       this.endYearTarget.style.display = 'none'
       this.yearTarget.style.display = 'inline-block'
     } else if (selectedOption === 'Monthly_for_one_year') {
       this.startYearTarget.style.display = 'inline-block'
       this.endYearTarget.style.display = 'inline-block'
       this.yearTarget.style.display = 'none'
     } else if (selectedOption === 'Hourly_for_one_month_in_a_single_year') {
       this.startYearTarget.style.display = 'inline-block'
       this.endYearTarget.style.display = 'none'
       this.yearTarget.style.display = 'inline-block'
     }
   }

   toggle(){
    const selectedOption = document.querySelector('#foo').value
    console.log(selectedOption)
    
   // console.log(yearField)
   // yearField.style.display = 'block';
   const yearField = document.querySelector('#yearField');
   const monthField = document.querySelector('#monthField');
   const startYearField = document.querySelector('#startYearField')
   const endYearField = document.querySelector('#endYearField')


   if (selectedOption === 'Range_across_years') {
    startYearField.style.display = 'inline-block'
    endYearField.style.display = 'inline-block'
    
    yearField.style.display = 'none'
    monthField.style.display = 'none'

  } else if (selectedOption === 'Compare_one_month_across_years') {
    startYearField.style.display = 'inline-block'
    endYearField.style.display = 'inline-block'
    monthField.style.display = 'inline-block'
    yearField.style.display = 'none'

  } else if (selectedOption === 'Monthly_for_one_year') {
    startYearField.style.display = 'none'
    endYearField.style.display = 'none'
    monthField.style.display = 'inline-block'
    yearField.style.display = 'inline-block'

  } else if (selectedOption === 'Hourly_for_one_month_in_a_single_year') {
    startYearField.style.display = 'none'
    endYearField.style.display = 'none'
    monthField.style.display = 'inline-block'
    yearField.style.display = 'inline-block'
  }
}
}
 
