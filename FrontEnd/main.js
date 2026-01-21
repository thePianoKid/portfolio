import '@hotwired/turbo'

document.addEventListener('DOMContentLoaded', () => {
  const screen = document.getElementById('torus')
  if (!screen) {
    return
  }

  const width = 80
  const height = 40
  let A = 0
  let B = 0

  const render = () => {
    const output = Array(width * height).fill(' ')
    const zbuffer = Array(width * height).fill(0)

    const R1 = 1
    const R2 = 2
    const K2 = 5
    const K1 = (width * K2 * 3) / (8 * (R1 + R2))

    for (let theta = 0; theta < 6.28; theta += 0.07) {
      const cosTheta = Math.cos(theta)
      const sinTheta = Math.sin(theta)

      for (let phi = 0; phi < 6.28; phi += 0.02) {
        const cosPhi = Math.cos(phi)
        const sinPhi = Math.sin(phi)

        const circleX = R2 + R1 * cosTheta
        const circleY = R1 * sinTheta

        const x =
          circleX * (Math.cos(B) * cosPhi + Math.sin(A) * Math.sin(B) * sinPhi) -
          circleY * Math.cos(A) * Math.sin(B)
        const y =
          circleX * (Math.sin(B) * cosPhi - Math.sin(A) * Math.cos(B) * sinPhi) +
          circleY * Math.cos(A) * Math.cos(B)
        const z = K2 + Math.cos(A) * circleX * sinPhi + circleY * Math.sin(A)
        const ooz = 1 / z

        const xp = Math.floor(width / 2 + K1 * ooz * x)
        const yp = Math.floor(height / 2 - K1 * ooz * y)
        const N =
          cosTheta * (Math.cos(B) * cosPhi + Math.sin(A) * Math.sin(B) * sinPhi) -
          Math.cos(A) * sinTheta * Math.sin(B)
        const idx = xp + yp * width

        if (idx >= 0 && idx < width * height && ooz > zbuffer[idx]) {
          zbuffer[idx] = ooz
          const luminance = Math.max(0, N)
          const chars = '.,-~:;=!*#$@'
          const charIdx = Math.min(chars.length - 1, Math.floor(luminance * 8))
          output[idx] = chars[charIdx]
        }
      }
    }

    let result = ''
    for (let i = 0; i < height; i++) {
      result += output.slice(i * width, (i + 1) * width).join('') + '\n'
    }

    screen.textContent = result

    A += 0.04
    B += 0.02
  }

  render()
  setInterval(render, 50)
})
