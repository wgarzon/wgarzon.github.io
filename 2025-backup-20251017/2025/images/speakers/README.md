# 📸 Guía de Imágenes - Speakers

## Ubicación
Coloca las fotos de los ponentes en esta carpeta: `public/images/speakers/`

## Nomenclatura
Usa el formato: `nombre-apellido.jpg`

Ejemplos:
- `maria-gonzalez.jpg`
- `carlos-rodriguez.jpg`
- `ana-martinez.jpg`

## Especificaciones Técnicas

### Tamaño Recomendado
- **400x400 píxeles** (formato cuadrado)
- Mínimo: 300x300px
- Máximo: 800x800px

### Formato
- **JPG** (recomendado para fotos)
- PNG (si necesitas transparencia)
- WEBP (para mejor compresión)

### Calidad
- Resolución: 72-150 DPI
- Tamaño de archivo: < 200 KB por imagen
- Compresión: Media-Alta calidad

### Estilo de Foto
✅ **Recomendado:**
- Foto profesional tipo headshot
- Fondo neutro o uniforme
- Buena iluminación
- Persona centrada
- Mirada a cámara
- Foto reciente

❌ **Evitar:**
- Fotos grupales
- Fondos muy ocupados
- Fotos borrosas o pixeladas
- Fotos muy oscuras
- Selfies casuales

## Cómo Agregar Nuevos Speakers

1. **Guarda la foto** en esta carpeta con el nombre correcto
2. **Abre** `app/data/conference-data.ts`
3. **Agrega** un nuevo objeto al array `speakers`:

```typescript
{
  name: 'Nombre Completo',
  role: 'Cargo',
  institution: 'Empresa/Universidad',
  country: '🇨🇴 País',
  topic: 'Tema Principal',
  description: 'Breve descripción',
  image: '/images/speakers/nombre-apellido.jpg',  // ← Tu imagen
  linkedin: 'https://www.linkedin.com/in/usuario/',
  color: 'from-blue-500 to-cyan-500'  // Elige un gradiente
}
```

## Colores Disponibles (Gradientes)

Puedes usar estos gradientes en el campo `color`:

```typescript
'from-blue-500 to-cyan-500'      // Azul agua
'from-purple-500 to-pink-500'    // Morado rosa
'from-orange-500 to-red-500'     // Naranja rojo
'from-green-500 to-teal-500'     // Verde turquesa
'from-indigo-500 to-blue-500'    // Índigo azul
'from-pink-500 to-rose-500'      // Rosa
'from-yellow-500 to-orange-500'  // Amarillo naranja
'from-cyan-500 to-blue-500'      // Cian azul
```

## Placeholder Temporal

Si aún no tienes la foto, el sistema mostrará automáticamente las iniciales del speaker con el color del gradiente seleccionado.

## Optimización de Imágenes (Opcional)

Para mejor rendimiento, comprime tus imágenes con:
- [TinyPNG](https://tinypng.com/) - Compresión PNG/JPG
- [Squoosh](https://squoosh.app/) - Compresión avanzada
- Photoshop: Exportar para web (calidad 60-80%)

## Ejemplo de Estructura

```
public/images/speakers/
├── maria-gonzalez.jpg
├── carlos-rodriguez.jpg
├── ana-martinez.jpg
├── roberto-silva.jpg
├── laura-perez.jpg
└── diego-morales.jpg
```

¡Listo! Una vez agregadas las imágenes, se mostrarán automáticamente en el sitio.
