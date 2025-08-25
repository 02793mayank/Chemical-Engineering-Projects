
document.querySelector("form").addEventListener("submit", function(e) {
  e.preventDefault();

  //header buttons functions
  function downloadPDF() {
      // Path to your PDF in GitHub repo (adjust username/repo/path)
      const pdfUrl = "https://raw.githubusercontent.com/02793mayank/Chemical-Engineering-Projects/main/HEAT%20EXCHANGER/docs/heatexchanger.pdf";

      // Create a hidden <a> tag
      const link = document.createElement("a");
      link.href = pdfUrl;
      link.download = "heatexchanger.pdf"; // Suggested filename
      document.body.appendChild(link);
      link.click();
      document.body.removeChild(link);
    }
  // Get form values
  let mHot = parseFloat(document.getElementById("mHot").value) || 0; // kg/hr
  let TinHot = parseFloat(document.getElementById("TinHot").value) || 0;
  let ToutHot = parseFloat(document.getElementById("ToutHot").value) || 0;
  let TinCold = parseFloat(document.getElementById("TinCold").value) || 0;
  let ToutCold = parseFloat(document.getElementById("ToutCold").value) || 0;
  let U = parseFloat(document.getElementById("U").value) || 0;

  // Tube parameters
  let L = parseFloat(document.getElementById("L").value) || 0; // m
  let Do = parseFloat(document.getElementById("Do").value) / 1000 || 0; // mm → m
  let t = parseFloat(document.getElementById("t").value) / 1000 || 0; // mm → m
  let Di = Do - 2*t; // inner diameter

  // Fluid properties inside tube
  let rho = parseFloat(document.getElementById("rhoTube").value) || 0; // kg/m³
  let mu = parseFloat(document.getElementById("muTube").value) / 1000 || 0; // mPa·s → Pa·s
  let Cp = parseFloat(document.getElementById("CpTube").value) || 0; // kJ/kgK

  // Step 1: Heat Duty Q = m*Cp*ΔT
  let mHot_kg_s = mHot / 3600; // convert to kg/s
  let Q = mHot_kg_s * Cp * 1000 * (TinHot - ToutHot); // W

  // Step 2: LMTD
  let dT1 = TinHot - ToutCold;
  let dT2 = ToutHot - TinCold;
  let LMTD = (dT1 - dT2) / Math.log(dT1 / dT2);

  // Step 3: Required Area
  let A = Q / (U * LMTD); // m²

  // Step 4: Flow velocity inside tube
  let volumetricFlow = mHot_kg_s / rho; // m³/s
  let Atube = Math.PI * (Di*Di) / 4; // single tube area
  let velocity = volumetricFlow / Atube; // m/s (if only 1 tube)

  // Step 5: Reynolds Number = (ρ*v*Di)/μ
  let Re = (rho * velocity * Di) / mu;

  // Step 6: No. of tubes required
  let Atube_surface = Math.PI * Do * L; // area of 1 tube
  let N_tubes = A / Atube_surface;

  // Show results
  document.getElementById("results-box").innerHTML = `
    <b>Heat Duty (Q):</b> ${(Q/1000).toFixed(2)} kW <br>
    <b>LMTD:</b> ${LMTD.toFixed(2)} °C <br>
    <b>Required Area (A):</b> ${A.toFixed(2)} m² <br>
    <b>Reynolds Number (Re):</b> ${Re.toFixed(0)} <br>
    <b>Estimated No. of Tubes:</b> ${Math.ceil(N_tubes)} 
  `;
});

