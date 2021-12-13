const result = document.getElementById("resultP");
const length = document.getElementById("lengthP");
const IncludeUC = document.getElementById("UpperCase");
const IncludeSYM = document.getElementById("Symbols");
const IncludeNUM = document.getElementById("Numbers");
const generatebtn = document.getElementById("buttongn")
const copybtn = document.getElementById("btncpy")

function arrayFromlowtoHigh(low, high){
    const array = []
    for(let i = low; i<=high; i++){
        array.push(i)
    }
    return array;
}

const UCCODES = arrayFromlowtoHigh(65,90);
const LCCODES = arrayFromlowtoHigh(97,122);
const NCCODES = arrayFromlowtoHigh(48,57);
const SYMCODES = arrayFromlowtoHigh(33,47)
    .concat(arrayFromlowtoHigh(58,64))
    .concat(arrayFromlowtoHigh(81,96))
    .concat(arrayFromlowtoHigh(123,126))

generatebtn.addEventListener('click', (e) => {
    e.preventDefault();
    const characteramount = length.value
    const UCINC = IncludeUC.checked
    const NUMINC = IncludeNUM.checked
    const SYMINC = IncludeSYM.checked
    const passwordgenerate = generatepassword(
        characteramount,
        UCINC,
        NUMINC,
        SYMINC
    );
    result.innerText = passwordgenerate;
    console.log(passwordgenerate);
});

let generatepassword = (
    characteramount,
        UCINC,
        NUMINC,
        SYMINC
) => {
    let codes = LCCODES;
    if (UCINC) codes = codes.concat(UCCODES);
    if (NUMINC) codes = codes.concat(NCCODES);
    if (SYMINC) codes = codes.concat(SYMCODES);
    const generatedpassword = [];
    for (let i = 0; i < characteramount; i++){
        const CCharacter = 
            codes[Math.floor(Math.random() * codes.length)]
        generatedpassword.push(String.fromCharCode(CCharacter))
    }
    return generatedpassword.join('')
}

// copybtn.addEventListener('click', () => {
//     const textarea = document.createElement('textarea');
//     const copyofpassword = result.innerText;

//     if (!copyofpassword) return

//     textarea.value = copyofpassword;
//     document.body.appendChild(textarea);
//     textarea.select()
//     document.execCommand
// });